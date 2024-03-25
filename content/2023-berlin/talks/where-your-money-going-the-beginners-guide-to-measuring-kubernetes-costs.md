---
title: "Where's your money going? The Beginners Guide To Measuring Kubernetes Costs"
---

## Where's your money going? The Beginners Guide To Measuring Kubernetes Costs

Speaker(s): [Erik Sommer](../../speakers/erik-sommer)

Accurately attributing cloud costs has become a Sisyphean task many companies face. As both the cloud and your systems evolve, it's hard to figure out what exactly is eating up all that money, let alone optimize those costs. In this session, we'll take you over the journey that got us to trustworthy cost estimations for Kubernetes clusters at Grafana Labs.

You'll get to see how we started, with just the metrics collected from kube-state-metrics and stored within Prometheus. We'll step through crafting the queries to create recording rules that will attribute costs of clusters across many cloud service providers.

Measuring the trends in costs for k8s is easy to get started with. If you're operating a k8s cluster and collecting metrics from kube-state-metrics, you likely already collect enough metrics. Keeping an eye on this and being able to alert on cost changes will allow you to mitigate shock bills in cloud providers.

<%= youtube_player("Cm0VDMXnvNA") %>