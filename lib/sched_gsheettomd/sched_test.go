package main

import (
	"testing"
	"time"

	"github.com/efficientgo/core/testutil"
)

func TestFormatTime(t *testing.T) {
	_, err := time.Parse(hourLayout, "30m")
	testutil.NotOk(t, err)
	testutil.Equals(t, "parsing time \"30m\": hour out of range", err.Error())

	h, err := time.Parse(hourLayout, "8:15")
	testutil.Ok(t, err)

	testutil.Equals(t, "8:15", formatTime(h))
}

func TestMdURLify(t *testing.T) {
	testutil.Equals(t, "richard-richih-hartmann", mdURLify("Richard \"RichiH\" Hartmann"))
	testutil.Equals(t, "opening-pandoras-box-redesigning", mdURLify("Opening Pandora’s Box: Redesigning PromQL for Scalable Computation"))
	testutil.Equals(t, "why-is-it-so-big-analysing-the-m", mdURLify("Why is it so big? Analysing the memory consumption of Prometheus"))
}
