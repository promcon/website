package main

import (
	"encoding/json"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"reflect"
	"strings"
	"text/template"
	"time"
	"unicode"
)

const dir = "../../content/2024-berlin/"
const urlSchedule = "https://sessionize.com/api/v2/sjj59wqg/view/GridSmart"
const urlSpeakers = "https://sessionize.com/api/v2/sjj59wqg/view/Speakers"

func main() {
	respSpeakers, err := http.Get(urlSpeakers)
	if err != nil {
		log.Fatal(err)
	}

	var speakersDecoded []Speaker
	if err := json.NewDecoder(respSpeakers.Body).Decode(&speakersDecoded); err != nil {
		log.Fatal(err)
	}

	speakers := make(map[string]Speaker, len(speakersDecoded))
	for _, speaker := range speakersDecoded {
		speaker.FilePath = strings.ToLower(speaker.FullName)
		speaker.FilePath = strings.Map(urlString, speaker.FilePath)
		speaker.Bio = strings.TrimSpace(speaker.Bio)

		for _, answer := range speaker.QuestionAnswers {
			if answer.Question == "Affiliation" {
				speaker.Affiliation = answer.Answer
			}
		}

		speakers[speaker.ID] = speaker
	}

	respSchedule, err := http.Get(urlSchedule)
	if err != nil {
		log.Fatal(err)
	}

	var daysDecoded []Day
	if err := json.NewDecoder(respSchedule.Body).Decode(&daysDecoded); err != nil {
		log.Fatal(err)
	}

	for i, day := range daysDecoded {
		for j, room := range day.Rooms {
			for k, session := range room.Sessions {
				filePath := strings.ToLower(session.Title)
				filePath = strings.Map(urlString, filePath)
				daysDecoded[i].Rooms[j].Sessions[k].FilePath = filePath

				for l, speaker := range session.Speakers {
					daysDecoded[i].Rooms[j].Sessions[k].Speakers[l].FilePath = speakers[speaker.ID].FilePath
					daysDecoded[i].Rooms[j].Sessions[k].Speakers[l].ProfilePicture = speakers[speaker.ID].ProfilePicture
				}
			}
		}
	}

	// Speakers
	{
		speakersDir := filepath.Join(dir, "/speakers")
		if err := os.RemoveAll(speakersDir); err != nil {
			log.Fatal(err)
		}
		if err := os.MkdirAll(speakersDir, os.ModePerm); err != nil {
			log.Fatal(err)
		}
		tmpl, err := template.New("").Funcs(funcs).ParseFiles("./speaker.tmpl.md")
		if err != nil {
			log.Fatal(err)
		}

		for _, speaker := range speakers {
			f, err := os.OpenFile(filepath.Join(speakersDir, speaker.FilePath+".md"), os.O_RDWR|os.O_CREATE, os.ModePerm)
			if err != nil {
				log.Fatal(err)
			}
			if err := tmpl.ExecuteTemplate(f, "speaker.tmpl.md", speaker); err != nil {
				log.Fatal(err)
			}
			_ = f.Close()
		}
	}

	// Talks
	{
		talksDir := filepath.Join(dir, "/talks")
		if err := os.RemoveAll(talksDir); err != nil {
			log.Fatal(err)
		}
		if err := os.MkdirAll(talksDir, os.ModePerm); err != nil {
			log.Fatal(err)
		}
		tmpl, err := template.New("").Funcs(funcs).ParseFiles("./talk.tmpl.md")
		if err != nil {
			log.Fatal(err)
		}

		for _, day := range daysDecoded {
			for _, room := range day.Rooms {
				for _, session := range room.Sessions {
					if session.IsServiceSession || !session.IsConfirmed {
						continue
					}

					f, err := os.OpenFile(filepath.Join(talksDir, session.FilePath+".md"), os.O_RDWR|os.O_CREATE, os.ModePerm)
					if err != nil {
						log.Fatal(err)
					}
					if err := tmpl.ExecuteTemplate(f, "talk.tmpl.md", session); err != nil {
						log.Fatal(err)
					}
					_ = f.Close()
				}
			}
		}
	}

	// Schedule
	{
		tmpl, err := template.New("").Funcs(funcs).ParseFiles("./schedule.tmpl.md")
		if err != nil {
			log.Fatal(err)
		}

		path := filepath.Join(dir, "/schedule.md")
		if err := os.Remove(path); err != nil {
			log.Fatal(err)
		}
		f, err := os.OpenFile(path, os.O_RDWR|os.O_CREATE, os.ModePerm)
		if err != nil {
			log.Fatal(err)
		}
		schedule := struct{ Days []Day }{Days: daysDecoded}
		if err := tmpl.ExecuteTemplate(f, "schedule.tmpl.md", schedule); err != nil {
			log.Fatal(err)
		}
		_ = f.Close()
	}
}

type Speaker struct {
	FilePath    string
	Affiliation string

	ID             string `json:"id"`
	FirstName      string `json:"firstName"`
	LastName       string `json:"lastName"`
	FullName       string `json:"fullName"`
	Bio            string `json:"bio"`
	TagLine        string `json:"tagLine"`
	ProfilePicture string `json:"profilePicture"`
	Links          []struct {
		Title    string `json:"title"`
		URL      string `json:"url"`
		LinkType string `json:"linkType"`
	} `json:"links"`
	QuestionAnswers []struct {
		ID           int    `json:"id"`
		Question     string `json:"question"`
		QuestionType string `json:"questionType"`
		Answer       string `json:"answer"`
		Sort         int    `json:"sort"`
		AnswerExtra  any    `json:"answerExtra"`
	} `json:"questionAnswers"`
}

type Day struct {
	Date  string `json:"date"`
	Rooms []Room `json:"rooms"`
}

type Room struct {
	ID       int       `json:"id"`
	Name     string    `json:"name"`
	Sessions []Session `json:"sessions"`
}

type Session struct {
	FilePath string

	ID          string `json:"id"`
	Title       string `json:"title"`
	Description string `json:"description"`
	StartsAt    string `json:"startsAt"`
	//EndsAt           string `json:"endsAt"`
	IsServiceSession bool `json:"isServiceSession"`
	//IsPlenumSession  bool   `json:"isPlenumSession"`
	Speakers []SessionSpeaker `json:"speakers"`
	//Categories       []any  `json:"categories"`
	//RoomID           int    `json:"roomId"`
	//Room             string `json:"room"`
	//LiveURL          any    `json:"liveUrl"`
	//RecordingURL     any    `json:"recordingUrl"`
	//Status           any    `json:"status"`
	//IsInformed       bool   `json:"isInformed"`
	IsConfirmed bool `json:"isConfirmed"`
}
type SessionSpeaker struct {
	FilePath string

	ID             string `json:"id"`
	Name           string `json:"name"`
	ProfilePicture string `json:"profilePicture"`
}

func urlString(r rune) rune {
	if unicode.IsSpace(r) {
		return '-'
	}
	if unicode.IsLetter(r) || unicode.IsNumber(r) {
		return r
	}
	return -1
}

var funcs = template.FuncMap{
	"last": func(x int, a interface{}) bool {
		return x == reflect.ValueOf(a).Len()-1
	},
	"add": func(a, b int) int { return a + b },
	"day": func(s string) string {
		return timeMustParse(s).Format("Monday, 2 January 2006")
	},
	"hour": func(s string) string { return timeMustParse(s).Format("15:04") },
}

func timeMustParse(s string) time.Time {
	t, err := time.Parse("2006-01-02T15:04:05", s)
	if err != nil {
		panic(err)
	}
	return t
}
