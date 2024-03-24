---
title: "Finding useless and resource-hungry Prometheus metrics"
---

## Finding useless and resource-hungry Prometheus metrics

Speaker(s): [David Calvert](../../speakers/david-calvert)

Did you ever wonder which of your scrapped Prometheus metrics were actually used and which wasn’t? Or which labels were responsible for your metrics cardinality? And how this could impact the performance of your Prometheus setup?

As an engineer, you might need to understand, track cardinality issues or reduce resource usage of your Prometheus setup. First step is to understand and measure what you have in your Prometheus’s TSDB. Hopefully we have now great tools to do that!

In this talk, I will explain how Mimirtool and Grafana can help you achieve this in no time!

We’ll cover:

* Analysing your Prometheus metrics usage with Mimirtool
* Dropping unused metrics on the exporter, or using relabeling rules
* Finding high-cardinality metrics on Prometheus
* Finding high-cardinality labels using the Cardinality Explorer Grafana dashboard
* A potential quick win to reduce Prometheus resource usage

<%= youtube_player("NRXAB_Ug8zo") %>