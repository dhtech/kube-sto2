#!/bin/sh
kubectl create configmap -n monitoring grafana-conf --from-file=grafana.ini=grafana.ini --from-file=ldap.toml=ldap.toml --from-file=ldap-ca.crt=ldap-ca.crt
