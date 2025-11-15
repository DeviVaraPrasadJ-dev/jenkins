{{- define "movie-review.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "movie-review.fullname" -}}
{{ .Release.Name }}
{{- end }}

{{- define "movie-review.labels" -}}
app.kubernetes.io/name: {{ include "movie-review.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "movie-review.selectorLabels" -}}
app.kubernetes.io/name: {{ include "movie-review.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

