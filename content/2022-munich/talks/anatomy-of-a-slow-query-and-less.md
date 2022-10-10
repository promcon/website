---
title: "Anatomy of a slow query, and lessons learned building query acceleration techniques"
---

## Anatomy of a slow query, and lessons learned building query acceleration techniques

Speaker(s): [Cyril Tovena](../../speakers/cyril-tovena) & [Marco Pracucci](../../speakers/marco-pracucci)

Have you ever experienced a slow query and wondered how it could be accelerated? This talk is for you!

In this presentation, Cyril and Marco Open Source contributors from the Grafana will dissect the anatomy of a slow query, and walk through the execution steps from when you click “Run query” until you get the query result.

We’ll then explore the options to speed up a query in Prometheus and the acceleration techniques adopted by Grafana Mimir, like query results caching, query sharding by time and series, and storage sharding. We’ll share our lessons learned, including successes and failures, for the benefit of the Prometheus community.

Finally, we’ll share further ideas on additional techniques Prometheus and Prometheus-compatible systems could adopt to further speed up the queries execution, like a query planner and query optimizer.

