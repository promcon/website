---
title: "Bring Order to Metrics Chaos: Building a Canonical Data Model with Prometheus Relabeling"
---

## Bring Order to Metrics Chaos: Building a Canonical Data Model with Prometheus Relabeling

Today's metric landscape is highly heterogeneous: Prometheus SDKs, OpenTelemetry, span metrics, service meshes and other sources coexist in most organizations, each with its own conventions and data model. The result is a proliferation of dashboards and alerts, and tribal knowledge about how to query and understand each source.
 
At Grafana Labs, we addressed this by defining a canonical data model and using Prometheus relabeling rules to map every source into it. This model runs in production today across hundreds of customer environments, and it is the foundation for platform-wide capabilities: generic dashboards, alerts and SLOs, as well as anomaly detection, insights, prioritized alerting and entity graphs — including the frameworks we presented at PromCon 2024 and 2025. Because relabeling rewrites labels on series you already ingest rather than materializing new ones, the canonical model comes with zero additional cardinality.
 
Mandating a single SDK or semantic convention is rarely an option, and even when it is, migrations are slow and complex. In this talk we show how to embrace the differences instead: how to design a canonical model for your organization, how to express per-source mappings as relabeling rules, and lessons from running this at scale — detecting which sources an environment actually ships, handling classic and native histograms side by side, and keeping the mappings robust as sources evolve. All examples shown will be open sourced.

### Speakers
[Jorge Creixell](../../speakers/jorge-creixell)

<img src="https://cdn.sessionize.com/image/b0b6-400o400o1-BioT8o1sdtC7aQtX1xumrL.jpg" style="width: 100px; border-radius: 50%" alt="Jorge Creixell Profile Picture"/>

[Nandakumar Devi](../../speakers/nandakumar-devi)

<img src="https://cdn.sessionize.com/image/4667-400o400o1-LACtbZ5X2ounH7XNYKo7VW.jpg" style="width: 100px; border-radius: 50%" alt="Nandakumar Devi Profile Picture"/>

