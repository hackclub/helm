{{/*
Expand the name of the chart.
*/}}
{{- define "midnight-core.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "midnight-core.fullname" -}}
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
{{- define "midnight-core.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "midnight-core.labels" -}}
helm.sh/chart: {{ include "midnight-core.chart" . }}
{{ include "midnight-core.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "midnight-core.selectorLabels" -}}
app.kubernetes.io/name: {{ include "midnight-core.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "midnight-core.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "midnight-core.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Generate imagePullSecret
*/}}
{{- define "imagePullSecret" }}
{{- with .Values.imageCredentials }}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"email\":\"%s\",\"auth\":\"%s\"}}}" (required "imageCredentials.registry is required when imageCredentials.enabled = true" .registry) (required "imageCredentials.username is required when imageCredentials.enabled = true" .username) (required "imageCredentials.password is required when imageCredentials.enabled = true" .password) (required "imageCredentials.email is required when imageCredentials.enabled = true" .email) (printf "%s:%s" .username  (required "imageCredentials.password is required when imageCredentials.enabled = true" .password) | b64enc) | b64enc }}
{{- end }}
{{- end }}
