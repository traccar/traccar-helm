{{/*
Expand the name of the chart.
*/}}
{{- define "traccar.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "traccar.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "traccar.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "traccar.labels" -}}
helm.sh/chart: {{ include "traccar.chart" . }}
{{ include "traccar.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "traccar.selectorLabels" -}}
app.kubernetes.io/name: {{ include "traccar.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "traccar.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "traccar.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "traccar.image" -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion }}
{{- if .Values.image.flavor }}
{{- printf "%s:%s-%s" .Values.image.repository $tag .Values.image.flavor }}
{{- else }}
{{- printf "%s:%s" .Values.image.repository $tag }}
{{- end }}
{{- end }}

{{- define "traccar.deploymentStrategy" -}}
{{- if or (.Values.traccar.broadcast.enabled) (index .Values "redis-ha").enabled }}
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: {{ coalesce .Values.deploymentStrategy.maxSurge "25%" | quote }}
    maxUnavailable: {{ coalesce .Values.deploymentStrategy.maxUnavailable "25%" | quote }}
{{- else }}
strategy:
  type: Recreate
{{- end }}
{{- end }}
