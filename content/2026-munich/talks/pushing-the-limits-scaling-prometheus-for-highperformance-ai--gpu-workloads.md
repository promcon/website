---
title: "Pushing the Limits: Scaling Prometheus for High-Performance AI & GPU Workloads"
---

## Pushing the Limits: Scaling Prometheus for High-Performance AI & GPU Workloads

As organizations rapidly scale their AI and LLM footprints, SRE teams are facing a new set of observability challenges. Monitoring traditional CPU and RAM metrics is no longer enough when a single frozen GPU or stalled AI agent can cause massive processing bottlenecks. But how do you extend Prometheus to handle the intense telemetry demands of multi-node GPU clusters, large language models, and agentic workflows, all without blowing up your Time Series Database (TSDB)?

In this session, we will explore how to push Prometheus to its limits to monitor large-scale AI infrastructure efficiently. Drawing from my experience as an AI SRE running distributed workloads at scale (and tinkering with GPU Kubernetes homelabs!), this talk provides practical, engineer-to-engineer guidance on building a robust AI observability stack using purely open-source tools.

Key takeaways include:

Scraping the Hardware: Integrating the NVIDIA DCGM exporter and CNCF Kepler (for energy monitoring) with Prometheus to track fine-grained GPU utilization, memory states, and thermal limits.

The AI Metrics Explosion: Strategies for handling high-cardinality data and optimizing Prometheus remote storage configurations, including dynamic sharding and relabeling, to manage intense LLM telemetry.

OpenTelemetry Interoperability: Leveraging Prometheus native histograms and expanding OTel interoperability to trace agentic workflows back to the underlying hardware layer without overwhelming your metrics pipeline.

SRE for AI: Defining actionable Service Level Indicators (SLIs) and building PromQL alerts for AI-specific failure modes (e.g., time-to-first-token latency, GPU OOM kills, and zombie inference pods).

Whether you are managing massive enterprise ML clusters or building a homelab, you will walk away with a production-ready blueprint for integrating AI workloads into your existing Prometheus ecosystem with no vendor hype, just open-source engineering.

### Speakers
[Sagar Utekar](../../speakers/sagar-utekar)

<img src="https://cdn.sessionize.com/image/c736-400o400o1-JAEQbqw6hnwDGW2x4x4qB3.png" style="width: 100px; border-radius: 50%" alt="Sagar Utekar Profile Picture"/>

