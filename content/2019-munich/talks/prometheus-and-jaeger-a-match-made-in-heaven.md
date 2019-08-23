---
title: "Prometheus and Jaeger: A Match Made in Heaven!"
---

## Prometheus and Jaeger: A Match Made in Heaven!

Speaker: [Goutham Veeramachaneni](/2019-munich/speakers/Goutham Veeramachaneni/)

Jaeger is an OSS distributed tracing solution, also part of the CNCF. Standalone, it can add immense value but when coupled with Prometheus, there is a lot more to gain. We have leveraged Prometheus and Jaeger together to make Cortex 10x faster and we will be sharing our journey and key learnings.  With Prometheus, we have our RED dashboards that highlight which services are slow, and we then use Jaeger to drill down and investigate which functions are taking how long, if we’re making too many calls, if we could batch calls together, etc. We then verify the impact using Jaeger and Prometheus after rolling out the changes. Without our RED dashboards, it would be shooting in the dark to find out which spans/services we should look at in Jaeger. Usually the slowness occurs in only one cluster. To enable filtering of traces to only that cluster/env, we enrich the traces with the same metadata that prometheus has.  We were also seeing very slow queries once in a while that weren’t very obvious when using only dashboards. We then started logging the trace ID in our request logs. We picked the requests that took too long, and used their trace IDs to probe for issues with that particular request. While this approach works, you need a solid log aggregation system, and even then it’s not exactly easy to find the interesting traces (longest/shortest requests). We will show you how Prometheus helps by providing us exemplars that can let us directly jump to the right traces from the latency dashboards. We will end the talk by demo-ing everything discussed.
