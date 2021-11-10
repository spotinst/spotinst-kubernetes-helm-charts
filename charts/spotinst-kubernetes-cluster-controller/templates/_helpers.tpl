{{/* vim: set filetype=mustache: */}}

{{/*
Chart name.
*/}}
{{- define "ocean-controller.name" -}}
spotinst-kubernetes-cluster-controller
{{- end }}

{{/*
Chart namespace.
*/}}
{{- define "ocean-controller.namespace" -}}
{{- default "kube-system" .Values.namespace }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ocean-controller.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "ocean-controller.commonLabels" -}}
helm.sh/chart: {{ include "ocean-controller.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: ocean-controller
{{- end }}

{{/*
Selector labels (ocean-controller).
*/}}
{{- define "ocean-controller.controllerLabels" -}}
k8s-app: {{ include "ocean-controller.name" . }}
{{- end }}

{{/*
Selector labels (ocean-aks-connector).
*/}}
{{- define "ocean-controller.aksConnectorLabels" -}}
k8s-app: {{ include "ocean-controller.name" . }}-aks-connector
{{- end }}

{{/*
Priority class name.
*/}}
{{- define "ocean-controller.priorityClassName" -}}
{{- if eq (include "ocean-controller.namespace" .) "kube-system" -}}
system-cluster-critical
{{- else -}}
spotinst-cluster-critical
{{- end -}}
{{- end }}

{{/*
ConfigMap name.
*/}}
{{- define "ocean-controller.configMapName" -}}
{{ default (include "ocean-controller.name" .) .Values.configMap.name }}
{{- end }}

{{/*
Secret name.
*/}}
{{- define "ocean-controller.secretName" -}}
{{ default (include "ocean-controller.name" .) .Values.secret.name }}
{{- end }}

{{/*
CA bundle secret name.
*/}}
{{- define "ocean-controller.caBundleSecretName" -}}
{{ default (include "ocean-controller.name" .) .Values.caBundleSecret.name }}
{{- end }}

{{/*
ServiceAccount name.
*/}}
{{- define "ocean-controller.serviceAccountName" -}}
{{ default (include "ocean-controller.name" .) .Values.serviceAccount.name }}
{{- end }}

{{/*
ClusterRole name.
*/}}
{{- define "ocean-controller.clusterRoleName" -}}
{{ include "ocean-controller.name" . }}
{{- end }}

{{/*
ClusterRoleBinding name.
*/}}
{{- define "ocean-controller.clusterRoleBindingName" -}}
{{ include "ocean-controller.name" . }}
{{- end }}

{{/*
Deployment name.
*/}}
{{- define "ocean-controller.deploymentName" -}}
{{ include "ocean-controller.name" . }}
{{- end }}

{{/*
Job name (ocean-aks-connector).
*/}}
{{- define "ocean-controller.aksConnectorJobName" -}}
{{ default (include "ocean-controller.name" .) .Values.aksConnector.jobName }}
{{- end }}
