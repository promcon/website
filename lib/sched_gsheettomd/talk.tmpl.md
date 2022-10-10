---
title: "{{ .Title }}"
---

## {{ .Title }}

Speaker(s): {{- range $i, $s := .Speakers }} [{{ $s.Name }}](../../speakers/{{ $s.RelLink }}){{if last $i $.Speakers | not}} &{{end}}{{end}}

{{ .Abstract }}
