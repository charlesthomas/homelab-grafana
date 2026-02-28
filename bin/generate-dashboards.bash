#!/bin/bash
set -e

# this script loads in all dashboard files in dashboards/*.json
# into a set of configmaps by the first letter of the filename,
# each of which then gets mounted as /etc/dashboards/$prefix.
# values.yaml includes a dashboardProvider to load all the dashboards from /etc/dashboards

[ -e resources/configmaps.yaml ] && rm resources/configmaps.yaml

for prefix in {a..z}; do
    eval "yq '.metadata.name = \"etc-dashboards-${prefix}\"' etc-dashboards.partial.yaml > \"etc-dashboards-${prefix}.yaml\""
    # have to use eval b/c of all the quoting yq requires and the singles are screwing with bash variables
    for yaml in $(find dashboards -name ${prefix}*.json); do
        exists=1
        bname=$(basename $yaml)
        eval "yq -i '.data.\"${bname}\" = load_str(\"${yaml}\")' \"etc-dashboards-${prefix}.yaml\""
    done
    cat etc-dashboards-${prefix}.yaml >> resources/configmaps.yaml
    rm etc-dashboards-${prefix}.yaml
done
