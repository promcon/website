---
title: Schedule
---

## {{ .EventName }} Schedule

<table class="table schedule-table">
{{- range .Days }}
  <tr class="day">
    <th colspan="3">{{ .Day }}</th>
  </tr>
  {{- range $i, $item := .Items }}
    {{- if $item.BreakName }}
  <tr class="break">
    <td>{{ $item.Hour }}</td>
    <td>{{ $item.BreakName }}</td>
    <td></td>
  </tr>
    {{- else if $item.OtherActivityName }}
  <tr class="talk">
    <td>{{ $item.Hour }}</td>
    <td>{{ $item.OtherActivityName }}</td>
    <td></td>
  </tr>
    {{- else}}
   <tr class="talk">
    <td>{{ $item.Hour }}</td>
    <td>
      {{if $item.Talk.RelLink }}<a href="../talks/{{ $item.Talk.RelLink }}">{{ $item.Talk.Title }}</a>{{else}}{{ $item.Talk.Title }}{{end}}
    </td>
    <td>
      {{- range $i, $s := $item.Talk.Speakers }}
      <a href="../speakers/{{ $s.RelLink }}">{{ $s.Name }}</a>
      <br>
      <b>{{ $s.Company }}</b>
      {{if last $i $item.Talk.Speakers | not}}<br/>{{end}}
      {{- end}}
    </td>
  </tr>
    {{- end}}
  {{- end}}
{{- end}}
</table>
