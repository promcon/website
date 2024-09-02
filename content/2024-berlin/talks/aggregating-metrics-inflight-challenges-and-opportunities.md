---
title: "Aggregating metrics in-flight: challenges and opportunities"
---

## Aggregating metrics in-flight: challenges and opportunities

One of the common practices for improving the query speed in Prometheus is to create recording rules for commonly used queries. While this usually works great, recording rules have a cost:

1. The raw metrics still need to be stored in the Prometheus, even if we don't need them
2. Recording rule needs to be executed on interval basis, putting extra pressure on the Prometheus
3. Adding a recording rule always means storing&processing more data

But what if we could do the pre-aggregation before metrics get into the Prometheus? Can we aggregate on scrape time? Or could clients do the aggregation before pushing data to Prometheus? At VictoriaMetrics we already started working on something we call Stream Aggregation. An ability for metrics collector to perform in-memory aggregations before forwarding data elsewhere (Prometheus including). It has many challenges related to time series nature of aggregated samples, network delays, horizontal scaling, etc. I'd like to share our experience with the community, as this may be a life-quality improving feature.


### Speakers
[Roman Khavronenko](../../speakers/roman-khavronenko)

<img src="https://sessionize.com/image/7260-400o400o1-QiP5qd5Fv7RBpL8itDTpbn.jpg" style="width: 100px; border-radius: 50%" alt="Roman Khavronenko Profile Picture"/>

