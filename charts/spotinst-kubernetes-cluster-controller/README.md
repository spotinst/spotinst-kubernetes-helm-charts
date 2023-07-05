# spotinst-kubernetes-cluster-controller

![Version: 1.0.116](https://img.shields.io/badge/Version-1.0.116-informational?style=flat-square) ![AppVersion: 1.0.95](https://img.shields.io/badge/AppVersion-1.0.95-informational?style=flat-square)

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
| affinity.nodeAffinity | object | `{"preferredDuringSchedulingIgnoredDuringExecution":[{"preference":{"matchExpressions":[{"key":"node-role.kubernetes.io/master","operator":"Exists"}]},"weight":100}],"requiredDuringSchedulingIgnoredDuringExecution":{"nodeSelectorTerms":[{"matchExpressions":[{"key":"kubernetes.io/os","operator":"NotIn","values":["windows"]}]}]}}` | Node affinity. (Optional) |
| affinity.podAntiAffinity | object | `{"preferredDuringSchedulingIgnoredDuringExecution":[{"podAffinityTerm":{"labelSelector":{"matchExpressions":[{"key":"k8s-app","operator":"In","values":["spotinst-kubernetes-cluster-controller"]}]},"topologyKey":"kubernetes.io/hostname"},"weight":50}]}` | Pod anti-affinity. (Optional) |
| aksConnector.acdIdentifier | string | `""` | Unique identifier used by the Ocean AKS Connector when (Optional) importing an AKS cluster. |
| aksConnector.enabled | bool | `true` | Controls whether the Ocean AKS Connector should be deployed (Optional) (requires a valid `aksConnector.acdIdentifier`). |
| aksConnector.image.pullPolicy | string | `"Always"` | Image pull policy. (Optional) |
| aksConnector.image.pullSecrets | list | `[]` | Image pull secrets. (Optional) |
| aksConnector.image.repository | string | `"spotinst/ocean-aks-connector:1.0.8"` | Image repository. (Optional) |
| aksConnector.jobName | string | `"spotinst-kubernetes-cluster-controller-aks-connector"` | Job name. (Optional) |
| aksConnector.nodeSelector | object | `{"kubernetes.azure.com/mode":"system"}` | Node selection constraints. (Optional) Ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#nodeselector |
| aksConnector.resources | object | `{}` | Resource requests and limits. (Optional) Ref: http://kubernetes.io/docs/user-guide/compute-resources/ |
| aksConnector.tolerations | list | `[{"key":"CriticalAddonsOnly","operator":"Exists"}]` | Tolerations for nodes that have taints on them. (Optional) Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| caBundleSecret.name | string | `"spotinst-kubernetes-cluster-controller-ca-bundle"` | Secret name. (Optional) |
| configMap.create | bool | `true` | Controls whether a ConfigMap should be created. (Optional) |
| configMap.name | string | `"spotinst-kubernetes-cluster-controller-config"` | ConfigMap name. (Optional) |
| deploymentAnnotations | object | `{}` | Annotations for ocean-controller deployment (Optional) |
| dnsConfig | object | `{}` | DNS config. (Optional) Ref: https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/ |
| dnsPolicy | string | `"Default"` | DNS policy. (Optional) Ref: https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy |
| image.pullPolicy | string | `"Always"` | Image pull policy. (Optional) |
| image.pullSecrets | list | `[]` | Image pull secrets. (Optional) |
| image.repository | string | `"gcr.io/spotinst-artifacts/kubernetes-cluster-controller"` | Image repository. (Optional) |
| metrics-server.args | list | `["--logtostderr"]` | Arguments to pass to metrics-server on start up. (Optional) |
| metrics-server.deployChart | bool | `true` | Specifies whether the metrics-server chart should be deployed. (Optional) |
| namespace | string | `"kube-system"` | Default namespace. (Optional) |
| replicas | int | `1` | configure the amount of replicas for the controller (Optional) |
| resources | object | `{}` | Resource requests and limits. (Optional) Ref: http://kubernetes.io/docs/user-guide/compute-resources/ |
| secret.create | bool | `true` | Controls whether a Secret should be created. (Optional) |
| secret.enabled | bool | `false` | Use a Secret instead of a ConfigMap to store credentials. Disabled for backward compatibility. (Optional) |
| secret.name | string | `"spotinst-kubernetes-cluster-controller"` | Secret name. (Optional) |
| serviceAccount.create | bool | `true` | Controls whether a ServiceAccount should be created. (Optional) |
| serviceAccount.name | string | `"spotinst-kubernetes-cluster-controller"` | Service account name. (Optional) |
| spotinst.account | string | `""` | Spot Account. (Required) Ref: https://docs.spot.io/administration/organizations?id=account |
| spotinst.baseUrl | string | `""` | Base URL. (Optional) |
| spotinst.clusterIdentifier | string | `""` | Unique identifier used by the Ocean Controller to connect (Required) between the Ocean backend and the Kubernetes cluster. Ref: https://docs.spot.io/ocean/tutorials/spot-kubernetes-controller/ |
| spotinst.disableAutoUpdate | bool | `false` | Disable auto update. (Optional) |
| spotinst.enableCsrApproval | bool | `false` | Enable CSR approval. (Optional) |
| spotinst.proxyUrl | string | `""` | Proxy URL. (Optional) |
| spotinst.token | string | `""` | Spot Token. (Required) Ref: https://docs.spot.io/administration/api/create-api-token |
| tolerations | list | `[{"effect":"NoExecute","key":"node.kubernetes.io/not-ready","operator":"Exists","tolerationSeconds":150},{"effect":"NoExecute","key":"node.kubernetes.io/unreachable","operator":"Exists","tolerationSeconds":150},{"key":"node-role.kubernetes.io/master","operator":"Exists"},{"key":"node-role.kubernetes.io/control-plane","operator":"Exists"}]` | Tolerations for nodes that have taints on them. (Optional) Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |

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
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
