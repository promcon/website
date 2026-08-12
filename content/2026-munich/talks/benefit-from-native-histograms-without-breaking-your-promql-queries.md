---
title: "Benefit from Native Histograms Without Breaking Your PromQL Queries"
---

## Benefit from Native Histograms Without Breaking Your PromQL Queries

Prometheus Native Histograms, including dynamic exponential buckets and explicit Native Histogram Custom Buckets (NHCB) deliver better compression, lower scrape overhead, and atomic observations.

Yet, migrating away from classic histograms remains difficult, because of the query surface change: auditing and rewriting battle-tested dashboards, recording rules, and critical alerting queries is risky, while dual-writing both formats doubles ingestion overhead.

In this talk, Raphael and Bartek present a new path forward: transparent PromQL query translation for backward compatibility.  By allowing the PromQL engine to query NHCBs using classic “_bucket” syntax, teams can upgrade their storage and ingestion pipelines without breaking their existing query surface. We will explore the architecture, control mechanisms, trade-offs, and potential extensions of bridging classic and native histograms seamlessly.

### Speakers
[Raphaël Bizos](../../speakers/raphaël-bizos)

<img src="https://cdn.sessionize.com/image/b011-400o400o1-W94J6vBS9WEBaaNC5FpAVu.jpg" style="width: 100px; border-radius: 50%" alt="Raphaël Bizos Profile Picture"/>

[Bartłomiej Płotka](../../speakers/bartłomiej-płotka)

<img src="https://cdn.sessionize.com/image/86b8-400o400o1-UhKWwHq2CTeRCdepgU6uTC.jpg" style="width: 100px; border-radius: 50%" alt="Bartłomiej Płotka Profile Picture"/>

