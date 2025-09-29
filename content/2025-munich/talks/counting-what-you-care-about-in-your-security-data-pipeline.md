---
title: "Counting What You Care About in Your Security Data Pipeline"
---

## Counting What You Care About in Your Security Data Pipeline

Traditional syslog systems have long been opaque — exporting minimal, fixed-format metrics that rarely reflect what users actually care about. AxoSyslog, a high-performance fork of syslog-ng, has taken a different path: not only adopting native Prometheus metrics, but also enabling metric emission directly from the user’s log processing logic.

In this talk, I’ll share how we transitioned from CSV-style global and per-driver metrics to full Prometheus integration. But more importantly, I’ll explore a less common mindset: treating metrics not as static artifacts of a system, but as programmable, user-defined views of what matters. Users can emit fine-grained, label-rich metrics from log routing logic itself — for example, tracking per-tenant message volume, labeling metrics with custom log or environment related info, or observing how often certain fields are missing.

We’ll walk through:
* What syslog metrics looked like historically (and why they fell short).
* Our journey to integrating Prometheus natively.
* How update_metric() works and why it's powerful.
* Real-world use cases where dynamic metrics made debugging and policy enforcement dramatically easier.

If you want to make observability accessible in deeply traditional parts of the stack — or want to let users code their own metrics — this talk is for you.

### Speakers
[Attila Szakács](../../speakers/attila-szakács)

<img src="https://sessionize.com/image/8b87-400o400o1-BCkfbFAhhxpV9u7TjXEHhN.jpg" style="width: 100px; border-radius: 50%" alt="Attila Szakács Profile Picture"/>

