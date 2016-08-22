---
id: alerting_in_the_prometheus_universe
title: "Alerting in the Prometheus Uniserve"
kind: talk
---

## Alerting in the Prometheus universe

In a Cloud Native infrastructure, failure is normal and expected. The loss of a
single node or a dozen hard drives is gracefully handled by the systems running
a datacenter and there is no reason to page someone at 4am.
This calls for an alerting system that understands service availability at a global
scope, yet is still able to give detailed reports if and when there is a service-impacting
incident. Prometheus achieves this by defining alerting conditions directly on time
series data. The resulting alerts are grouped and aggregated into comprehensive and
meaningful notifications.

Fabian will walk through the philosophy of time series based alerting, the Prometheus
architecture behind it, and how practical anomaly detection can be implemented.

