---
title: "{{ .FullName }}"
---

{{ if .ProfilePicture }}
<img src="{{ .ProfilePicture }}" style="width: 150px; float: right; border-radius: 50%" alt="{{ .FullName }} Profile Picture"/>
{{- end }}
## {{ .FullName }}
<br>
{{- range $i, $s := .Links }}
[{{ $s.Title }}]({{ $s.URL }}){{if last $i $.Links | not}}, {{end}}{{end}}

{{- if .Affiliation }}

Working at {{ .Affiliation }}
{{- end}}

{{ .Bio }}
