# MetalLB

## Commands

Change `ipvs` to `true`
```sh
kubectl edit configmap -n kube-system kube-proxy
```

```yml
apiVersion: kubeproxy.config.k8s.io/v1alpha1
kind: KubeProxyConfiguration
mode: "ipvs"
ipvs:
  strictARP: true
```

Apply
```sh
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml
```

## Reference

- [https://metallb.universe.tf/installation/](https://metallb.universe.tf/installation/)