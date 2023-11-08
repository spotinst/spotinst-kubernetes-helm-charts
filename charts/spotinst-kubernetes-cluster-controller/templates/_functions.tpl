{{/*
Takes a memory value with a human readable name (like 4Gi), returns memory in bytes.
*/}}
{{- define "memory-convert" -}}
{{- $input := (toString .) -}}
{{- $number := (regexFind "[0-9]*" $input) -}}
{{- $suffix := (trimPrefix $number $input) -}}

{{- $multiplier := 1 -}}
{{- if eq $suffix "k" -}}
  {{- $multiplier = 1000 -}}

{{- else if eq $suffix "M" -}}
  {{- $multiplier = 1000000 -}}

{{- else if eq $suffix "G" -}}
  {{- $multiplier = 1000000000 -}}

{{- else if eq $suffix "T" -}}
  {{- $multiplier = 1000000000000 -}}

{{- else if eq $suffix "Ki" -}}
  {{- $multiplier = 1024 -}}

{{- else if eq $suffix "Mi" -}}
  {{- $multiplier = 1048576 -}}

{{- else if eq $suffix "Gi" -}}
  {{- $multiplier = 1073741824 -}}

{{- else if eq $suffix "Ti" -}}
  {{- $multiplier = 1099511627776 -}}
{{- end -}}

{{- mul $number $multiplier -}}
{{- end -}}
