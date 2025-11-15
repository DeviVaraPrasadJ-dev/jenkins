{{- define "movie-review.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{- define "movie-review.fullname" -}}
{{- printf "%s" (include "movie-review.name" .) -}}
{{- end -}}
