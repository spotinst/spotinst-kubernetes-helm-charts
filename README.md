# Spotinst Kubernetes Helm Charts

The official repository for all Spotinst Kubernetes Helm Charts.

## Installation

1. Grant Tiller access to create resources in `kube-system` namespace (see: [Tiller and Role-based Access Control](https://docs.helm.sh/using_helm/#tiller-and-role-based-access-control)):
```sh
# Create a ServiceAccount for Tiller
$ kubectl create serviceaccount tiller \
  --namespace=kube-system

# Create a ClusterRoleBinding
$ kubectl create clusterrolebinding tiller-cluster-rule \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:tiller

# Patch Tiller's Deployment to use `tiller` service account
$ kubectl patch deployment tiller-deploy \
  --namespace=kube-system \
  --patch='{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
```

2. Add Spotinst's Helm charts repository:
```sh
$ helm repo add spotinst https://spotinst.github.io/spotinst-kubernetes-helm-charts
```

3. Update information of available charts:
```sh
$ helm repo update
```

4. Install the Spotinst Kubernetes cluster controller:
```sh
$ helm install spotinst/spotinst-kubernetes-cluster-controller \
  --set spotinst.token=REDACTED \
  --set spotinst.account=REDACTED \
  --set spotinst.clusterIdentifier=REDACTED
```
> NOTE: Please configure all chart's values using the `set` command line argument or a `values.yaml` file.

## Documentation

If you're new to Spotinst and want to get started, please checkout our [Getting Started](https://api.spotinst.com/getting-started-with-spotinst/) guide, available on the [Spotinst Documentation](https://api.spotinst.com/) website.

## Getting Help

We use GitHub issues for tracking bugs and feature requests. Please use these community resources for getting help:

* Ask a question on [Stack Overflow](https://stackoverflow.com/) and tag it with [spotinst-kubernetes-helm-charts](https://stackoverflow.com/questions/tagged/spotinst-kubernetes-helm-charts/).
* Join our Spotinst community on [Slack](http://slack.spotinst.com/).
* Open an [issue](https://github.com/spotinst/spotinst-kubernetes-helm-charts/issues/new/choose/).

## Community

* [Slack](http://slack.spotinst.com/)
* [Twitter](https://twitter.com/spotinst/)

## License
Code is licensed under the [Apache License 2.0](https://github.com/spotinst/spotinst-kubernetes-helm-charts/blob/master/LICENSE/).
