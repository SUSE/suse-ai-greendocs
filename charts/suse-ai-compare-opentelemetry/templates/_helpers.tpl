{{/*
Expand the name of the chart.
*/}}
{{- define "ai-compare-opentelemetry.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "ai-compare-opentelemetry.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- if eq .Release.Name "ai-compare" -}}
{{- printf "ai-compare" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ai-compare-opentelemetry.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "ai-compare-opentelemetry.labels" -}}
helm.sh/chart: {{ include "ai-compare-opentelemetry.chart" . }}
{{ include "ai-compare-opentelemetry.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
observability.opentelemetry.io/enabled: "true"
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "ai-compare-opentelemetry.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ai-compare-opentelemetry.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
