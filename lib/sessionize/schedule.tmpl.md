---
title: Schedule
---

<table class="table schedule-table">
{{- range $i, $day := .Days }}
  <tr class="day">
    <th colspan="3">Day {{add $i 1}} - {{ day .Date }}</th>
  </tr>
  {{ range .Rooms }}
  {{- range $i, $session := .Sessions }}
    {{- if $session.IsServiceSession }}
  <tr class="break">
    <td>{{ hour $session.StartsAt }}</td>
    <td>{{ $session.Title }}</td>
    <td></td>
  </tr>
    {{- else if eq $session.IsConfirmed false }}
   <tr class="talk">
    <td>{{ hour $session.StartsAt }}</td>
    <td>To Be Announced</td>
    <td></td>
   </tr>
    {{- else}}
   <tr class="talk">
    <td>{{ hour $session.StartsAt }}</td>
    <td>
      {{if $session.FilePath }}<a href="../talks/{{ $session.FilePath }}">{{ $session.Title }}</a>{{else}}{{ $session.Talk.Title }}{{end}}
    </td>
    <td>
      {{- range $i, $s := $session.Speakers }}
      <a href="../speakers/{{ $s.FilePath }}">{{ $s.Name }}</a>
      <br>
      {{- end}}
    </td>
  </tr>
    {{- end}}
  {{- end}}
  {{- end}}
{{- end}}
</table>
