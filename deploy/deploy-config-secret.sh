#!/bin/sh

# Read out the redis password
PASS=$(python -c 'import yaml; import base64; print base64.b64decode(yaml.load(file("deploy-redis-secret.yml"))["data"]["password"])')

cat << _EOF_ > deploy.yaml
redis:
  host: deploy-redis.tech.dreamhack.se
  port: 1338
  ssl: True
  password: $PASS
_EOF_

kubectl create secret generic deploy-config -n deploy \
  --from-file=deploy.yaml

rm deploy.yaml
