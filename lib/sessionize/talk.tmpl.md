---
title: "{{ .Title }}"
---

## {{ .Title }}

{{ .Description }}

### Speakers 
{{- range $i, $s := .Speakers }}
[{{ $s.Name }}](../../speakers/{{ $s.FilePath }})
{{ if $s.ProfilePicture }}
<img src="{{ $s.ProfilePicture }}" style="width: 100px; border-radius: 50%" alt="{{ $s.Name }} Profile Picture"/>
{{- end}}
{{end}}
