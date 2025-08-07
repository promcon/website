---
title: "Reverse-Engineering PromQL Usage: A Proxy’s Tale"
---

## Reverse-Engineering PromQL Usage: A Proxy’s Tale

Prometheus provides you with metrics, but it doesn’t really explain how those metrics are being utilized. Which queries are lagging? Who’s running them? Which dashboards are bombarding the backend every 10 seconds? In many cases, it’s like trying to see into a black box.  In this talk, I’ll dive into how we developed Prom Analytics Proxy to shed light on PromQL usage at scale, without needing to touch your Prometheus servers. I’ll take you through our technical journey: creating a low-overhead query proxy, monitoring metrics like latency, cardinality, and error rates, and organizing everything in a way that’s easy to query.  You’ll find out what strategies worked, what didn’t go as planned, what caught us off guard, and how this initiative empowered teams to better understand and manage, how Prometheus is truly being utilized in production.

### Speakers
[Nicolas Takashi](../../speakers/nicolas-takashi)

<img src="https://sessionize.com/image/61ca-400o400o1-9f254122-30dc-45a6-939b-a5a913985df6.jpg" style="width: 100px; border-radius: 50%" alt="Nicolas Takashi Profile Picture"/>

