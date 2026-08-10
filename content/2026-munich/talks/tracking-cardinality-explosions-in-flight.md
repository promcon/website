---
title: "Tracking Cardinality Explosions In Flight"
---

## Tracking Cardinality Explosions In Flight

A new deploy adds a user_id label, and overnight a job goes from 500 to 500,000 series. The index bloats, ingestion slows, and by the time someone gets paged the damage is done. The natural response is to ask the database how bad it is with something like `count({__name__=~".*"}) by (job)`, but that query has to scan the entire series set. It becomes a query of death, and it fails exactly when the storage is already overloaded. In other words, we try to measure cardinality using the same resource that cardinality is putting at risk.

This talk is about estimating cardinality in flight, while the metrics are still streaming in. The estimator runs as a separate pipeline alongside the storage, not inside it. A small estimator keeps a HyperLogLog sketch per label dimension and publishes the results as ordinary metrics in Prometheus exposition format. It receives data over remote-write and is scraped like any other target. There are no queries against storage, no new query language to learn, and nothing tied to a specific vendor, so any Prometheus-compatible setup can use it.

What makes this practical is how little it costs to run. It takes about 1 CPU core for processing 1 Mil samples/s, not more than 150MiB per each configured cardinality tracker. Memory is bounded by configuration you choose up front rather than by how large the workload grows, which is what makes the estimator safe to run continuously. Because each estimate is just a cheap metric, you can put it directly in your alerting rules. A cardinality spike then pages you within minutes and tells you which job, tenant, or metric caused it, straight from the alert.

I will walk through the topology that allows to track cardinality without affecting the production pipeline, explain accuracy and memory tradeoffs behind HyperLogLog precision, and how the work splits across storage and selector nodes to scale horizontally. The reference implementation is open source under Apache 2.0, ships with default alerting rules and Grafana dashboards, and already runs against production workloads.


### Speakers
[Roman Khavronenko](../../speakers/roman-khavronenko)

<img src="https://cdn.sessionize.com/image/02ab-400o400o1-NMSKDKvd7MarjCsZq3dCRJ.jpg" style="width: 100px; border-radius: 50%" alt="Roman Khavronenko Profile Picture"/>

[Langson Zhang](../../speakers/langson-zhang)

<img src="https://cdn.sessionize.com/image/367c-400o400o1-sqZEqA28PqnvCCd1BRvcuN.png" style="width: 100px; border-radius: 50%" alt="Langson Zhang Profile Picture"/>

