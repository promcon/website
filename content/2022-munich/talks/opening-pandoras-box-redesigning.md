---
title: "Opening Pandora’s Box: Redesigning PromQL for Scalable Computation"
---

## Opening Pandora’s Box: Redesigning PromQL for Scalable Computation

Speaker(s): [Bartłomiej Płotka](../../speakers/bartłomiej-płotka) & [Filip Petkovski](../../speakers/filip-petkovski)

Thanks to projects like Thanos, Mimir and Cortex, the ecosystem can ingest large amounts of Prometheus metrics and retain them for long periods of time. Although storing large amounts of data is feasible today at a fairly low cost, querying such volumes of data efficiently and within reasonable time is still quite challenging.

A central piece to this problem is that most of the metrics systems in the Prometheus ecosystem import the PromQL engine from Prometheus itself. While this engine has had many optimizations over the past years, it is primarily designed to be executed in a single-threaded, single-node environment. This design decision puts a hard scalability limit on how quickly and efficiently a single query can be executed.

In this talk, Filip and Bartek will show the open-source PromQL query engine that the Thanos Community has been developing over the past several months. They will demonstrate how we achieved extreme latency and efficiency improvements by utilizing multiple cores on multiple machines. The audience will learn about the architecture of the new engine, how they can start using it in production in all projects (not only Thanos!), how to contribute and what we might see in the future.
