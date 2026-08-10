---
title: "Fast Startup in Prometheus"
---

## Fast Startup in Prometheus

When Prometheus restarts, it needs to replay the Write-Ahead Log (WAL) to restore its in-memory state. In large setups, this synchronous replay can take a very long time, in the order of 10s of minutes (even an hour+). While this happens, the TSDB is completely locked. That means no new scrapes and queries unavailable. This leaves a gap in the data and even appears as a visible gap in 2 replica HA setup when querying during the restarts.

As part of the LFX mentorship program, we developed a fast startup process in Prometheus that does not block your scrapes while Prometheus is replaying the WAL. We will go over the conceptual design of decoupling the WAL replay from scraping and how this actually eliminates the query gaps from restarts in the HA setup. We will also touch upon ideas to eliminate gaps in recording rules due to restarts.

### Speakers
[Rushabh Mehta](../../speakers/rushabh-mehta)

<img src="https://cdn.sessionize.com/image/fa37-400o400o1-NJNXWCgVLGAQSE3TmcYEh5.jpg" style="width: 100px; border-radius: 50%" alt="Rushabh Mehta Profile Picture"/>

[Ganesh Vernekar](../../speakers/ganesh-vernekar)

<img src="https://cdn.sessionize.com/image/0f5a-400o400o1-fUECapMP3mby4aRxVsjVru.jpg" style="width: 100px; border-radius: 50%" alt="Ganesh Vernekar Profile Picture"/>

