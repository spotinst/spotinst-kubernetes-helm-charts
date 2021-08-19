# Spot Helm Chart Repository for Kubernetes

The official repository for all Spot Helm Charts for Kubernetes.

## Installation

1. Add the Spot Helm chart repository:

```sh
helm repo add spotinst https://spotinst.github.io/spotinst-kubernetes-helm-charts
```

2. Update your local Helm chart repository cache:

```sh
helm repo update
```

3. Install a chart. For example, install the Ocean Controller:

```sh
helm install my-release spotinst/spotinst-kubernetes-cluster-controller \
  --set spotinst.token=REDACTED \
  --set spotinst.account=REDACTED \
  --set spotinst.clusterIdentifier=REDACTED \
  # [...]
```

> NOTE: Please configure all required chart values using the `set` command line argument or a `values.yaml` file.

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
