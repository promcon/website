---
title: "{{ .FullName }}"
---

## {{ .FullName }}

{{- range $i, $s := .Links }}
[{{ $s.Title }}]({{ $s.URL }}){{if last $i $.Links | not}}, {{end}}{{end}}

{{- if .Affiliation }}

Working at {{ .Affiliation }}
{{- end}}

{{ .Bio }}
