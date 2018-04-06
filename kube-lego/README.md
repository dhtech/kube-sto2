# kube-lego

Let's Encrypt service daemon.

Example ingress:
```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: grafana-ingress
  namespace: monitoring
  annotations:
    kubernetes.io/tls-acme: "true"
spec:
  tls:
  - secretName: grafana-ingress-tls
    hosts:
    - grafana.tech.dreamhack.se
  rules:
  - host: grafana.tech.dreamhack.se
    http:
      paths:
      - path: /
        backend:
          serviceName: grafana
          servicePort: 80
```