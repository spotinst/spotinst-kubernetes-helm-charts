# spotinst-kubernetes-cluster-controller

![Version: 1.0.107](https://img.shields.io/badge/Version-1.0.107-informational?style=flat-square) ![AppVersion: 1.0.87](https://img.shields.io/badge/AppVersion-1.0.87-informational?style=flat-square)

A Helm chart for Ocean Controller.

## Installation

1. Add the Spot Helm chart repository:

```sh
helm repo add spotinst https://spotinst.github.io/spotinst-kubernetes-helm-charts
```

2. Update your local Helm chart repository cache:

```sh
helm repo update
```

3. Install `spotinst-kubernetes-cluster-controller`:

```sh
helm install my-release spotinst/spotinst-kubernetes-cluster-controller \
  --set spotinst.token=REDACTED \
  --set spotinst.account=REDACTED \
  --set spotinst.clusterIdentifier=REDACTED \
  # [...]
```

> NOTE: Please configure all required chart values using the `set` command line argument or a `values.yaml` file.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://kubernetes-sigs.github.io/metrics-server | metrics-server | 3.8.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity.nodeAffinity | object | `{"preferredDuringSchedulingIgnoredDuringExecution":[{"preference":{"matchExpressions":[{"key":"node-role.kubernetes.io/master","operator":"Exists"}]},"weight":100}],"requiredDuringSchedulingIgnoredDuringExecution":{"nodeSelectorTerms":[{"matchExpressions":[{"key":"kubernetes.io/os","operator":"NotIn","values":["windows"]}]}]}}` | (Optional) Node affinity. |
| affinity.podAntiAffinity | object | `{"preferredDuringSchedulingIgnoredDuringExecution":[{"podAffinityTerm":{"labelSelector":{"matchExpressions":[{"key":"k8s-app","operator":"In","values":["spotinst-kubernetes-cluster-controller"]}]},"topologyKey":"kubernetes.io/hostname"},"weight":50}]}` | (Optional) Pod anti-affinity. |
| aksConnector.acdIdentifier | string | `""` | (Optional) Unique identifier used by the Ocean AKS Connector when importing an AKS cluster. |
| aksConnector.enabled | bool | `true` | (Optional) Controls whether the Ocean AKS Connector should be deployed (requires a valid `aksConnector.acdIdentifier`). |
| aksConnector.image.pullPolicy | string | `"Always"` | (Optional) Image pull policy. |
| aksConnector.image.pullSecrets | list | `[]` | (Optional) Image pull secrets. |
| aksConnector.image.repository | string | `"spotinst/ocean-aks-connector:1.0.8"` | (Optional) Image repository. |
| aksConnector.jobName | string | `"spotinst-kubernetes-cluster-controller-aks-connector"` | (Optional) Job name. |
| aksConnector.nodeSelector | object | `{"kubernetes.azure.com/mode":"system"}` | (Optional) Node selection constraints. Ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#nodeselector |
| aksConnector.resources | object | `{}` | (Optional) Resource requests and limits. Ref: http://kubernetes.io/docs/user-guide/compute-resources/ |
| aksConnector.tolerations | list | `[{"key":"CriticalAddonsOnly","operator":"Exists"}]` | (Optional) Tolerations for nodes that have taints on them. Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| caBundleSecret.name | string | `"spotinst-kubernetes-cluster-controller-ca-bundle"` | (Optional) Secret name. |
| configMap.create | bool | `true` | (Optional) Controls whether a ConfigMap should be created. |
| configMap.name | string | `"spotinst-kubernetes-cluster-controller-config"` | (Optional) ConfigMap name. |
| dnsConfig | object | `{}` | (Optional) DNS config. Ref: https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/ |
| dnsPolicy | string | `"Default"` | (Optional) DNS policy. Ref: https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy |
| image.pullPolicy | string | `"Always"` | (Optional) Image pull policy. |
| image.pullSecrets | list | `[]` | (Optional) Image pull secrets. |
| image.repository | string | `"gcr.io/spotinst-artifacts/kubernetes-cluster-controller"` | (Optional) Image repository. |
| metrics-server.args | list | `["--logtostderr"]` | (Optional) Arguments to pass to metrics-server on start up. |
| metrics-server.deployChart | bool | `true` | (Optional) Specifies whether the metrics-server chart should be deployed. |
| namespace | string | `"kube-system"` | (Optional) Default namespace. |
| replicas | int | `1` | (Optional) configure the amount of replicas for the controller |
| resources | object | `{}` | (Optional) Resource requests and limits. Ref: http://kubernetes.io/docs/user-guide/compute-resources/ |
| secret.create | bool | `true` | (Optional) Controls whether a Secret should be created. |
| secret.enabled | bool | `false` | (Optional) Use a Secret instead of a ConfigMap to store credentials. Disabled for backward compatibility. |
| secret.name | string | `"spotinst-kubernetes-cluster-controller"` | (Optional) Secret name. |
| serviceAccount.create | bool | `true` | (Optional) Controls whether a ServiceAccount should be created. |
| serviceAccount.name | string | `"spotinst-kubernetes-cluster-controller"` | (Optional) Service account name. |
| spotinst.account | string | `""` | (Required) Spot Account. Ref: https://docs.spot.io/administration/organizations?id=account |
| spotinst.baseUrl | string | `""` | (Optional) Base URL. |
| spotinst.clusterIdentifier | string | `""` | (Required) Unique identifier used by the Ocean Controller to connect between the Ocean backend and the Kubernetes cluster. Ref: https://docs.spot.io/ocean/tutorials/spot-kubernetes-controller/ |
| spotinst.disableAutoUpdate | bool | `false` | (Optional) Disable auto update. |
| spotinst.enableCsrApproval | bool | `false` | (Optional) Enable CSR approval. |
| spotinst.proxyUrl | string | `""` | (Optional) Proxy URL. |
| spotinst.token | string | `""` | (Required) Spot Token. Ref: https://docs.spot.io/administration/api/create-api-token |
| tolerations | list | `[{"effect":"NoExecute","key":"node.kubernetes.io/not-ready","operator":"Exists","tolerationSeconds":150},{"effect":"NoExecute","key":"node.kubernetes.io/unreachable","operator":"Exists","tolerationSeconds":150},{"key":"node-role.kubernetes.io/master","operator":"Exists"},{"key":"node-role.kubernetes.io/control-plane","operator":"Exists"}]` | (Optional) Tolerations for nodes that have taints on them. Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |

## Documentation

If you're new to Spot and want to get started, please check out our [Getting Started](https://docs.spot.io/connect-your-cloud-provider/) guide, available on the [Spot Documentation](https://docs.spot.io/) website.

## Getting Help

We use GitHub issues for tracking bugs and feature requests. Please use these community resources for getting help:

- Ask a question on [Stack Overflow](https://stackoverflow.com/) and tag it with [spotinst-kubernetes-helm-charts](https://stackoverflow.com/questions/tagged/spotinst-kubernetes-helm-charts/).
- Join our Spot community on [Slack](http://slack.spotinst.com/).
- Open an [issue](https://github.com/spotinst/spotinst-kubernetes-helm-charts/issues/new/choose/).

## Community

- [Slack](http://slack.spotinst.com/)
- [Twitter](https://twitter.com/spotinst/)

## License

Code is licensed under the [Apache License 2.0](https://github.com/spotinst/spotinst-kubernetes-helm-charts/blob/master/LICENSE/).

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.7.0](https://github.com/norwoodj/helm-docs/releases/v1.7.0)
