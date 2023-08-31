---
title: "Alert analytics"
---

## Alert analytics

Speaker(s): [Monika Singh](../../speakers/monika-singh)

At Cloudflare, we use Prometheus heavily. We have point-of-presense in more than 275+ number of cities and each point-of-presense have their own prometheus. All these prometheis send alerts to a central alertmanager. We have various integrations to route the alerts. We also route all the alerts to a datastore for alert analytics.

The talk covers:

- What is Alert fatigue and its impact?
- What is alert analytics and why is it important? - The purpose of alert analysis is to give feedback to monitoring system.
- Core concepts of Alertmanager.
- How to do Alert Analysis using open source tools such as Promtheus, Alertmanager, Vector.dev, ClickHouse, Grafana.
- Outcome and Conclusion.
