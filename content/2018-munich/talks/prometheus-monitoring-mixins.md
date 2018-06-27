---
title: "Prometheus Monitoring Mixins: Using Jsonnet to Package Together Dashboards, Alerts, and Exporters"
---

## Prometheus Monitoring Mixins: Using Jsonnet to Package Together Dashboards, Alerts, and Exporters

Speaker: [Tom Wilkie](/2018-munich/speakers/tom-wilkie/)

Prometheus offers powerful open source monitoring and alerting - but that comes with higher degrees of freedom, making pre-configured monitoring "packages" hard to build. Simultaneously, it's becoming accepted wisdom that the developers of a given software package are best placed to operate said software, or at least construct the basic monitoring configuration.

In this talk we present a technique for using Jsonnet (a configuration language from Google) for packaging and deploying "Monitoring Mixins" - extensible and customisable combinations of dashboards, alert definitions and exporters. This technique allows developers of open source projects to publish best-practice monitoring configurations alongside their code, and for users to consume it, customise it and stay up to date. We will present example Mixins for Kubernetes and other services such as Consul, Vault, and Cassandra.
