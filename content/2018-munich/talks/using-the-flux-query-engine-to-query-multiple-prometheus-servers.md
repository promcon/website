---
title: Using the Flux Query Engine to Query Multiple Prometheus Servers
---

## Using the Flux Query Engine to Query Multiple Prometheus Servers

Speaker: [Paul Dix](/2018-munich/speakers/paul-dix/)

The new open source Flux query engine for InfluxDB is designed to be decoupled from storage. This makes it possible to query many different data sources, including Prometheus, with the new engine. The engine also decouples the representation of the query language from the execution representation. This makes it possible to add support for additional languages, like PromQL.

This talk will show how we've added support to the Flux engine to query multiple Prometheus servers at the same time, combining their results. This makes it trivial to query across a federated setup for scaling out the query. We'll also show how to query across two Prometheus servers configured for high availability, while guaranteeing a consistent query result.

We'll close out the talk by looking at how PromQL support is being added to the new engine. This will enable PromQL queries across a distributed system where the individual Prometheus and storage servers maintain their shared-nothing non-clustered failure modes.
