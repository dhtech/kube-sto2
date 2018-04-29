#!/bin/sh

kubectl create secret generic redis-ssl -n deploy \
  --from-file=deploy.crt --from-file=deploy.key
