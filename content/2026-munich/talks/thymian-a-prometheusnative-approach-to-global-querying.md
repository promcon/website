---
title: "Thymian: A Prometheus-Native Approach to Global Querying"
---

## Thymian: A Prometheus-Native Approach to Global Querying

Thymian is a working prototype for a distributed query planner for Prometheus, targeting environments that need a global view across many independent Prometheus instances. It answers queries as if it were a single Prometheus instance, fanning out partial queries to downstream instances and combining the results.

Thymian's philosophy is to rely solely on native Prometheus capabilities by querying downstreams through the HTTP API and invoking the Prometheus PromQL engine. This makes Thymian a distributed query planner rather than a distributed engine.

In Thymian, each downstream is configured with a unique set of virtual labels that make time series distinguishable across downstreams, for example env="prod",region="europe" or env="dev",region="america". Since virtual labels do not exist in the downstream TSDBs, Thymian injects them at execution time.

When queried, Thymian parses the PromQL AST and plans its distributed execution. It identifies expressions in the AST that can be pushed down and determines which downstreams are targeted based on the virtual label matchers in the query. The query is executed by fanning out the expressions and evaluating the remainder through the Prometheus PromQL engine over the partial results.

The talk covers how Thymian analyzes PromQL constructs for push-down eligibility and how queries are rewritten to combine the partial results. Finally, it discusses the limitations of this approach.

### Speakers
[Victor Herrero Otal](../../speakers/victor-herrero-otal)

<img src="https://cdn.sessionize.com/image/3c52-400o400o1-PhDbPkHfzhiC8jJZWR3wos.jpg" style="width: 100px; border-radius: 50%" alt="Victor Herrero Otal Profile Picture"/>

