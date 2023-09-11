---
title: "Yet Another Streaming PromQL Engine"
---

## Yet Another Streaming PromQL Engine

Speaker(s): [György Krajcsovits](../../speakers/gyorgy-krajcsovits)

Mimir is great at ingesting enormous amounts of time series data. But we think it can be even better at querying enormous amounts of time series data. So we’ve been working to improve Mimir’s query performance and resource consumption, with the goal to evaluate queries faster while also reducing CPU utilisation and peak memory consumption.

One of the key ways we believe we can achieve this goal is with a streaming PromQL engine. We experimented with Thanos’ new streaming engine, which streams results one time step at a time, but found it couldn’t tick all the boxes we needed. So we’ve recently begun prototyping an alternative engine that instead streams by series, with promising early results.

In this talk, I’ll:

- demonstrate our prototype PromQL engine that computes results over streams of series, and share our preliminary benchmark results, the lessons we’ve learnt so far, and what we plan to try next
- compare the pros and cons of the prototype engine, Prometheus’ default PromQL engine and Thanos’ streaming PromQL engine
- explain how Mimir’s other query optimisation techniques, such as streaming chunks and time splitting of queries, uniquely complement a PromQL engine that computes results over streams of series
