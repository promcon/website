---
title: "Kubernetes: Engineering PromQL Queries for Prometheus and OpenTelemetry Convergence"
---

## Kubernetes: Engineering PromQL Queries for Prometheus and OpenTelemetry Convergence

Prometheus exporters and OpenTelemetry receivers represent Kubernetes objects with different data models. Fleets of clusters may run both; so how can we ensure parity for dashboards, alerts and recording rules without duplicating effort?

Semantic Conventions are bringing multi-vendor agreement, though sometimes with increasingly complex queries. By diving deep into workload labels and attributes, we'll discuss the changes we're proposing upstream and the level of support for standard and non-standard workloads.

Our goal is having both communities contribute to each other. For example, library integration instead of forking encourages sustainable and active ecosystems on both sides. We'll show an example of complementary maintenance in the kubernetes-mixin and kubernetes-mixin-otel projects. Attendees will also gain an understanding of three query engineering strategies: Prometheus-native, OTel-native, and finally - the unified approach.

### Speakers
[Serena Kei](../../speakers/serena-kei)

<img src="https://cdn.sessionize.com/image/cc65-400o400o1-XWGAhz5tRSb7qhUCrWXaCE.jpg" style="width: 100px; border-radius: 50%" alt="Serena Kei Profile Picture"/>

[Stephen Lang](../../speakers/stephen-lang)

<img src="https://cdn.sessionize.com/image/91d9-400o400o1-3bKuWk3Ez5tAL66Aeq89iH.jpg" style="width: 100px; border-radius: 50%" alt="Stephen Lang Profile Picture"/>

