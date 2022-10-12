---
title: "{{ .Name }}"
---

{{- if .TwitterHandle }}
## [{{ .Name }}](https://twitter.com/{{ .TwitterHandle }})
{{- else}}
## {{ .Name }}
{{- end}}

{{- if .Company }}

Working at {{ .Company }}
{{- end}}

{{ .Bio }}
