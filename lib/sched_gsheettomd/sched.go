package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"reflect"
	"strings"
	"text/template"
	"time"

	"github.com/efficientgo/core/errcapture"
	"github.com/efficientgo/core/errors"
	"github.com/efficientgo/core/merrors"
	"golang.org/x/oauth2/google"
	"google.golang.org/api/option"
	"google.golang.org/api/sheets/v4"
)

const (
	// Specific to 2022 spreadsheet format. For different format this code has to be adjusted, but that's easier to do
	// on existing code than from scratch.
	scheduleSheet          = "Schedule"
	talkDetailsSheet       = "Talk Details"
	talkTitleCol           = "M"
	talkAbstractCol        = "N"
	talkNameSpeaker1Col    = "D"
	talkAffSpeaker1Col     = "F"
	talkBioSpeaker1Col     = "G"
	talkTwitterSpeaker1Col = "E"

	talkNameSpeaker2Col    = "H"
	talkAffSpeaker2Col     = "J"
	talkBioSpeaker2Col     = "K"
	talkTwitterSpeaker2Col = "I"
)

var (
	daysTitles = []string{"Day 1 - Tuesday, November 8", "Day 2 - Wednesday, November 9"}

	flagSet flag.FlagSet

	// The default is for 2022 spreadsheet https://docs.google.com/spreadsheets/d/1qdI8-vtOUsIRH3G7o_uYaVBUCFDGg4E28bSHOH-W9rE/edit#gid=1640819368
	spreadsheetID   = flagSet.String("spreadsheet.id", "1qdI8-vtOUsIRH3G7o_uYaVBUCFDGg4E28bSHOH-W9rE", "ID of the Google spreadsheet with the schedule.")
	credentialsFile = flagSet.String("credentials.file", "", "See https://developers.google.com/sheets/api/quickstart/go how to create JSON with Oauth2 credentials.")

	eventName = flagSet.String("event-name", "PromCon 2022", "")
	outDir    = flagSet.String("out.dir", "../../2022-munich", "")
)

func main() {
	if err := run(); err != nil {
		log.Fatalf("Execution failed: %+v", err)
	}
}

func run() error {
	if err := flagSet.Parse(os.Args[1:]); err != nil {
		return err
	}

	ctx := context.Background()
	b, err := os.ReadFile(*credentialsFile)
	if err != nil {
		return errors.Wrapf(err, "can't read credentials from file %v (set by -credentials.file)", *credentialsFile)
	}

	// If modifying these scopes, delete your previously saved token.json.
	config, err := google.ConfigFromJSON(b, "https://www.googleapis.com/auth/spreadsheets.readonly")
	if err != nil {
		return errors.Wrap(err, "unable to parse client secret file to config.")
	}

	srv, err := sheets.NewService(ctx, option.WithHTTPClient(getClient(config)))
	if err != nil {
		return errors.Wrap(err, "unable to retrieve sheets client")
	}

	fmt.Println("Populating data from sheet", *spreadsheetID, "- this might take a few seconds...")
	sched, err := populateSchedule(srv)
	if err != nil {
		return err
	}
	fmt.Println("Done! Rendering files...")

	return renderSchedule(sched, *outDir)
}

type Schedule struct {
	EventName string
	Days      []Day

	speakersByName map[string]*Speaker
}

type Day struct {
	Day string

	Items []Item
}

type Item struct {
	Hour string

	// Either Talk is non-nil, BreakName is non-empty or OtherActivityName is non-empty.
	Talk              *Talk
	BreakName         string
	OtherActivityName string
}

type Speaker struct {
	Name          string
	RelLink       string
	Company       string
	Bio           string
	TwitterHandle string
}

type Talk struct {
	Title    string
	Abstract string
	RelLink  string

	Speakers []*Speaker
}

const hourLayout = "15:04"

func formatTime(t time.Time) string {
	return strings.TrimPrefix(t.Format(hourLayout), "0")
}

type details struct {
	titles          [][]interface{}
	abstract        [][]interface{}
	speaker1Name    [][]interface{}
	speaker1Aff     [][]interface{}
	speaker1Bio     [][]interface{}
	speaker1Twitter [][]interface{}

	speaker2Name    [][]interface{}
	speaker2Aff     [][]interface{}
	speaker2Bio     [][]interface{}
	speaker2Twitter [][]interface{}
}

func (d details) rowID(talkTitle string) int {
	for i, row := range d.titles {
		if len(row) == 0 {
			continue
		}
		if row[0].(string) == talkTitle {
			return i
		}
	}
	return -1
}

func (d details) get(rowID int, field [][]interface{}) string {
	if len(field) <= rowID {
		return ""
	}
	r := field[rowID]
	if len(r) == 0 {
		return ""
	}
	return r[0].(string)
}

func populateDetails(srv *sheets.Service) (details, error) {
	merrs := merrors.New()

	getFn := func(col string) [][]interface{} {
		r, err := srv.Spreadsheets.Values.Get(*spreadsheetID, fmt.Sprintf("%v!%v2:%v", talkDetailsSheet, col, col)).Do()
		if err != nil {
			merrs.Add(err)
			return nil
		}
		return r.Values
	}

	d := details{
		titles:          getFn(talkTitleCol),
		abstract:        getFn(talkAbstractCol),
		speaker1Name:    getFn(talkNameSpeaker1Col),
		speaker1Aff:     getFn(talkAffSpeaker1Col),
		speaker1Bio:     getFn(talkBioSpeaker1Col),
		speaker1Twitter: getFn(talkTwitterSpeaker1Col),

		speaker2Name:    getFn(talkNameSpeaker2Col),
		speaker2Aff:     getFn(talkAffSpeaker2Col),
		speaker2Bio:     getFn(talkBioSpeaker2Col),
		speaker2Twitter: getFn(talkTwitterSpeaker2Col),
	}
	return d, merrs.Err()
}

func populateSchedule(srv *sheets.Service) (Schedule, error) {
	s := Schedule{EventName: *eventName, speakersByName: map[string]*Speaker{}}

	d, err := populateDetails(srv)
	if err != nil {
		return s, errors.Wrapf(err, "populating details from sheet %v", talkDetailsSheet)
	}

	var currTime time.Time
	var duration time.Duration
	return s, foreachRow(srv, func(row []interface{}, day int) error {
		var (
			err         error
			durationCol = len(row) - 1
		)

		if len(s.Days) == day {
			s.Days = append(s.Days, Day{Day: daysTitles[day]})

			// Here we expect hour as the last row.
			durationCol--
			h, err := time.Parse(hourLayout, row[len(row)-1].(string))
			if err != nil {
				return errors.Wrapf(err, "expected hour to be in the last column of sheet %v", scheduleSheet)
			}
			currTime = h
		} else {
			currTime = currTime.Add(duration)
		}

		s.Days[day].Items = append(s.Days[day].Items, Item{Hour: formatTime(currTime)})
		item := &(s.Days[day].Items[len(s.Days[day].Items)-1])

		duration, err = time.ParseDuration(row[durationCol].(string))
		if err != nil {
			return errors.Wrapf(err, "expected duration to be in the %v column of sheet %v", durationCol, scheduleSheet)
		}

		title := row[durationCol-1].(string)
		if title == "" {
			// This is a break type or other activity type.
			name := strings.Trim(row[0].(string), "\t")
			if name == "Social Event" || name == "Lightning Talks" {
				item.OtherActivityName = name
			} else {
				item.BreakName = name
			}
			return nil
		}

		detailsRowID := d.rowID(title)
		if detailsRowID == -1 {
			return errors.Newf("can't find details about talk with the title %q", title)
		}

		// Talk.
		item.Talk = &Talk{
			Title:    strings.Replace(title, "\"", "", -1),
			Abstract: d.get(detailsRowID, d.abstract),
		}

		if item.Talk.Abstract != "" {
			item.Talk.RelLink = mdURLify(title)
		}

		// Speaker 1
		spk1Name := d.get(detailsRowID, d.speaker1Name)
		if spk1Name == "" {
			return errors.Newf("can't find details about the main speaker for the talk the title %q", title)
		}
		spk1, ok := s.speakersByName[spk1Name]
		if !ok {
			spk1 = &Speaker{
				Name:          strings.Replace(spk1Name, "\"", "", -1),
				Company:       d.get(detailsRowID, d.speaker1Aff),
				Bio:           d.get(detailsRowID, d.speaker1Bio),
				TwitterHandle: d.get(detailsRowID, d.speaker1Twitter),
				RelLink:       mdURLify(spk1Name),
			}
			s.speakersByName[spk1Name] = spk1
		}
		item.Talk.Speakers = append(item.Talk.Speakers, spk1)

		spk2Name := d.get(detailsRowID, d.speaker2Name)
		if spk2Name == "" {
			return nil
		}

		spk2, ok := s.speakersByName[spk2Name]
		if !ok {
			spk2 = &Speaker{
				Name:          strings.Replace(spk2Name, "\"", "", -1),
				Company:       d.get(detailsRowID, d.speaker2Aff),
				Bio:           d.get(detailsRowID, d.speaker2Bio),
				TwitterHandle: d.get(detailsRowID, d.speaker2Twitter),
				RelLink:       mdURLify(spk2Name),
			}
			s.speakersByName[spk2Name] = spk2
		}
		item.Talk.Speakers = append(item.Talk.Speakers, spk2)
		return nil
	})
}

func mdURLify(s string) string {
	s = strings.Replace(s, " ", "-", -1)
	s = strings.Replace(s, "_", "-", -1)
	s = strings.Replace(s, "?", "", -1)
	s = strings.Replace(s, ".", "", -1)
	s = strings.Replace(s, "'", "", -1)
	s = strings.Replace(s, ",", "", -1)
	s = strings.Replace(s, ";", "", -1)
	s = strings.Replace(s, "`", "", -1)
	s = strings.Replace(s, "’", "", -1)
	s = strings.Replace(s, ":", "", -1)
	s = strings.Replace(s, "\"", "", -1)
	s = strings.TrimSpace(s)
	s = strings.ToLower(s)
	if len(s) > 32 {
		s = s[:32]
	}
	return s
}

func foreachRow(srv *sheets.Service, do func(row []interface{}, day int) error) error {
	var lastEmpty bool
	day := 0

	for i := 1; ; i++ {
		row := fmt.Sprintf("%v!A%d:F%d", scheduleSheet, i, i)

		r, err := srv.Spreadsheets.Values.Get(*spreadsheetID, row).Do()
		if err != nil {
			return err
		}

		if len(r.Values) == 0 {
			if lastEmpty {
				return nil
			}

			lastEmpty = true
			day++
			continue
		}
		lastEmpty = false

		if err := do(r.Values[0], day); err != nil {
			return err
		}
	}
}

var funcs = template.FuncMap{
	"last": func(x int, a interface{}) bool {
		return x == reflect.ValueOf(a).Len()-1
	},
}

func renderSchedule(s Schedule, dir string) (err error) {
	// schedule.md
	{
		tmpl, err := template.New("").Funcs(funcs).ParseFiles("./schedule.tmpl.md")
		if err != nil {
			return err
		}

		if err := os.RemoveAll(filepath.Join(dir, "schedule.md")); err != nil {
			return err
		}
		f, err := os.OpenFile(filepath.Join(dir, "schedule.md"), os.O_RDWR|os.O_CREATE, os.ModePerm)
		if err != nil {
			return err
		}
		defer errcapture.Do(&err, f.Close, "close")

		if err := tmpl.ExecuteTemplate(f, "schedule.tmpl.md", s); err != nil {
			return err
		}
	}

	// Speakers.
	{
		speakersDir := filepath.Join(dir, "speakers")
		if err := os.RemoveAll(speakersDir); err != nil {
			return err
		}
		if err := os.MkdirAll(speakersDir, os.ModePerm); err != nil {
			return err
		}
		tmpl, err := template.ParseFiles("./speaker.tmpl.md")
		if err != nil {
			return err
		}

		for _, v := range s.speakersByName {
			f, err := os.OpenFile(filepath.Join(speakersDir, v.RelLink+".md"), os.O_RDWR|os.O_CREATE, os.ModePerm)
			if err != nil {
				return err
			}
			defer errcapture.Do(&err, f.Close, "close")

			if err := tmpl.ExecuteTemplate(f, "speaker.tmpl.md", v); err != nil {
				return err
			}
		}
	}
	// Talks.
	{
		talksDir := filepath.Join(dir, "talks")
		if err := os.RemoveAll(talksDir); err != nil {
			return err
		}
		if err := os.MkdirAll(talksDir, os.ModePerm); err != nil {
			return err
		}
		tmpl, err := template.New("").Funcs(funcs).ParseFiles("./talk.tmpl.md")
		if err != nil {
			return err
		}

		for _, d := range s.Days {
			for _, item := range d.Items {
				if item.Talk == nil || item.Talk.Abstract == "" {
					continue
				}

				f, err := os.OpenFile(filepath.Join(talksDir, item.Talk.RelLink+".md"), os.O_RDWR|os.O_CREATE, os.ModePerm)
				if err != nil {
					return err
				}
				defer errcapture.Do(&err, f.Close, "close")

				if err := tmpl.ExecuteTemplate(f, "talk.tmpl.md", item.Talk); err != nil {
					return err
				}
			}
		}
	}

	return nil
}
