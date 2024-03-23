#!/bin/bash

# this script loads in all dashboard files in grafana/dashboards/*.json
# into a single configmap, which then gets mounted as /etc/dashboards.
# values.yaml includes a dashboardProvider to load all the dashboards from /etc/dashboards

cp etc-dashboards.partial.yaml .etc-dashboards.in.yaml
for yaml in $(ls dashboards/*.json); do
    bname=$(basename $yaml)
    cmd="yq '.data.\"${bname}\" = load_str(\"${yaml}\")' .etc-dashboards.in.yaml > .etc-dashboards.out.yaml"
    eval $cmd
    mv .etc-dashboards.out.yaml .etc-dashboards.in.yaml
done
mv .etc-dashboards.in.yaml resources/configmaps.yaml
