#!/bin/sh

kubectl create secret generic dhdns-grpc -n cert-manager \
  --from-file=certificate=grpc.crt --from-file=key=grpc.key
