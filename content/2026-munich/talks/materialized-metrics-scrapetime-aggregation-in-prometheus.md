---
title: "Materialized metrics: scrape-time aggregation in Prometheus"
---

## Materialized metrics: scrape-time aggregation in Prometheus

In Kubernetes, labels tied to ephemeral infra resources are a constant challenge. Node rotations and pod churn often spike cardinality, degrading reliability by suddenly forcing queries to load more and more series.

Prometheus relies on recording rules to drop these labels, but rule evaluations come with tradeoffs. Rules might improve query latency but not efficiency. They have the downside of shifting a one-time query into a continuous load, and users have to set a fixed rate to sum without the labels.

At Reddit, we decided to implement a new approach in Prometheus we called materialized metrics. They aggregate series concurrently at scrape time, avoiding sequential bottlenecks, and focus strictly on removing labels.

The impact: it dropped network load and response time by 85%, with 99.85% accuracy compared to rules. This talk is a deep dive into the design, the challenges we encountered, and the path to make it part of upstream Prometheus.


### Speakers
[Walther Lee](../../speakers/walther-lee)

<img src="https://cdn.sessionize.com/image/a366-400o400o1-VyYcDu8TX6t9cWxp9XHXhC.jpg" style="width: 100px; border-radius: 50%" alt="Walther Lee Profile Picture"/>

[Aleksandr Krivoshchekov](../../speakers/aleksandr-krivoshchekov)

<img src="https://cdn.sessionize.com/image/83ba-400o400o1-JtecvJZTZ3kstpGnRUhwmQ.png" style="width: 100px; border-radius: 50%" alt="Aleksandr Krivoshchekov Profile Picture"/>

