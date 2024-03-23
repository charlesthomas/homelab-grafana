# homelab-grafana

This is a mirco-services repo for deploying
[grafana](https://grafana.com/)
into [my homelab](https://github.com/charlesthomas/homelab).

## generate dashboards

in an effort to make it easy to provision dashboards without going crazy trying to maintain
a giant configmap full of json blobs, i created `generate-dashboards.sh`.

it uses `yq` to dynamically generate a configmap of all the dashboards stored in `dashboards/` so that each dashboard can be stored seaparately.

this requires regenerating the configmap every time you add a new dashboard:

```bash
./generate-dashboards.sh
```

---
This repo is templated via
[homelab-template](https://github.com/charlesthomas/homelab-template)
and automatically updated via
[🤖 Templatron](https://github.com/charlesthomas/templatron).
