---
title: "Out Of Order Support in Prometheus"
---

## Out Of Order Support in Prometheus

Speaker(s): [Jesús Vázquez](../../speakers/jesús-vázquez) & [Ganesh Vernekar](../../speakers/ganesh-vernekar)

Until Prometheus v2.38.0, Prometheus’ TSDB only accepted in-order samples if they were less than 1 hour old, discarding everything else. As Prometheus continues to be adopted in new fields this poses an increasingly hard problem. Several use cases need out-of-order support, for example:

* IoT devices waking up asynchronously and writing metrics
* complex metric delivery architectures using message buses like Kafka with randomized sharding and delay due to congestion
* standalone Prometheus instances isolated from a network connection for some time trying to push old samples.

Prometheus v2.39.0 comes with support for ingesting out of order samples up to a configurable time limit.

We will talk about how we designed the new system, challenges faced while extending Prometheus TSDB, interesting decisions such as adding a new “Write Behind Log” instead of reusing the traditional Write Ahead Log, etc.

We will also share our experience running this in production with millions of series at Grafana Labs and the performance characteristics at scale.
