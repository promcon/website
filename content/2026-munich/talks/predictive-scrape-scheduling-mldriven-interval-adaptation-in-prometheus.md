---
title: "Predictive Scrape Scheduling: ML-Driven Interval Adaptation in Prometheus"
---

## Predictive Scrape Scheduling: ML-Driven Interval Adaptation in Prometheus

DESCRIPTION:
Prometheus scrapes every target at a fixed interval, 15 seconds for most production deployments. This uniformity is operationally simple but deeply inefficient: a static metric like go_info or a counter that moves only during deployments is polled at the same cadence as a high-frequency latency histogram that changes every second. The result is wasted I/O, unnecessary CPU on instrumented services and inflated TSDB churn for metrics that carry almost no new information between scrapes.
This talk presents a novel adaptive scrape scheduling algorithm implemented as an experimental Prometheus feature flag. The system observes the information entropy of each metric series over a rolling window quantified as the coefficient of variation of deltas between consecutive samples and dynamically adjusts the effective scrape interval for that series between a configured floor and ceiling. Series with low information gain (near-zero delta variance) are progressively downsampled to a coarser interval; series exhibiting rapid change are promoted to the shortest permissible interval. The algorithm uses an exponential moving average over entropy scores to avoid thrashing on transient spikes.
The presentation covers three components: the per-series entropy tracker added to the scrape loop, the scheduler that bins targets into interval tiers and the metadata signals (prometheus_adaptive_scrape_interval, prometheus_entropy_score) surfaced for observability of the scheduling decisions themselves. A detailed cost model is presented showing 30–60 % reduction in total sample ingestion rate on a real 400-node Kubernetes cluster, with no degradation in alert latency for high-entropy metrics. The talk also addresses the interaction with staleness handling, federation and remote write each of which has subtleties when scrape intervals become heterogeneous within a single job.
Open questions around operator ergonomics (how to express "never downsample this metric") and the implications for recording rule evaluation windows are explored candidly, with an invitation for community feedback before formalizing an upstream proposal.

BENEFITS TO THE ECOSYSTEM:
Fixed-interval scraping is one of Prometheus's most sacred assumptions, baked into everything from staleness markers to rate() semantics. Challenging it in a principled way has significant ecosystem impact. If accepted upstream, adaptive scrape scheduling would
(1) meaningfully reduce the CPU and memory overhead on both Prometheus servers and scraped targets particularly impactful for IoT, embedded exporters and high-node-count Kubernetes clusters
(2) lower egress costs in remote-write deployments where operators pay per sample pushed to Grafana Cloud, Amazon Managed Prometheus, or similar services
(3) extend the practical retention window achievable with a given TSDB block size, democratizing longer-term local storage for teams that cannot afford Thanos or Mimir and 
(4) open the door to a class of "quiet period" optimizations during nights and weekends, where most services have negligible traffic, dramatically cutting monitoring infrastructure costs without any manual configuration.

For the community, the entropy-score metadata creates a new class of meta-observability dashboards that show which metrics are actually "earning their keep" enabling informed decisions about instrumentation quality rather than blind accumulation of series. This is directly applicable to the cardinality governance conversations already happening across the ecosystem.

### Speakers
[Yogesh Sardana](../../speakers/yogesh-sardana)

<img src="https://cdn.sessionize.com/image/a2ce-400o400o1-BB7GBxZtAkRFPM6Qv9Rh7h.jpg" style="width: 100px; border-radius: 50%" alt="Yogesh Sardana Profile Picture"/>

