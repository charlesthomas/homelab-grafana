# homelab-grafana

This is a mirco-services repo for deploying
[grafana](https://grafana.com/)
into [my homelab](https://github.com/charlesthomas/homelab).

## dashboards

grafana's dashboard sidecar loads every ConfigMap in the cluster labeled `grafana_dashboard: "1"`.

each templated service ships its own `grafana/<name>.json` that way via `configMapGenerator` in its `kustomization.yaml`.
cluster-wide dashboards that don't belong to any one service live in `resources/dashboards/`.

---
This repo is templated via
[homelab-template](https://github.com/charlesthomas/homelab-template)
and automatically updated via
[🤖 Templatron](https://github.com/charlesthomas/templatron).
