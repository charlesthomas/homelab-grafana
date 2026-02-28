#!/bin/bash
set -e

if [ -z $1 ]; then
  echo "$0 app-name (no homelab- prefix)"
  exit 1
fi

cp -v ../homelab-$1/grafana/$1.json dashboards/
./bin/generate-dashboards.bash
git add dashboards/$1.json
git add resources/configmaps.yaml
git commit -m "feat: add $1"
git push
