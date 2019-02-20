# Spotinst Kubernetes Helm Charts

The official repository for all Spotinst Kubernetes Helm Charts.

## Installing

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

For a comprehensive documentation, check out the [API documentation](http://api.spotinst.com/).
