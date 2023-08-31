---
title: "Finding useless and resource-hungry Prometheus metrics"
---

## Finding useless and resource-hungry Prometheus metrics

Speaker(s): [David Calvert](../../speakers/david-calvert)

Did you ever wonder which of your scrapped Prometheus metrics were actually used and which wasn’t? And how this could impact the performance of your Prometheus setup?

I recently had the task to stabilise, track cardinality issues, and significantly reduce resource usage of a Prometheus setup. In order to do that, I first needed to analyse the Prometheus and Thanos stack. In this talk, I will explain how I used Grafana mimirtool to identify which metrics were used on the platform, and which wasn’t.

We’ll also see why it’s important to know that, and what we can do with this information: configuring exporters, using relabeling rules and explore the cardinality of our metrics. All those things that may, or may not, improve the performance of your Prometheus setup!
