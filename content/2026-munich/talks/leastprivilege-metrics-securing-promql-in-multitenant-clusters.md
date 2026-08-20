---
title: "Least-Privilege Metrics: Securing PromQL in Multi-Tenant Clusters"
---

## Least-Privilege Metrics: Securing PromQL in Multi-Tenant Clusters

Prometheus was built for one team, one cluster. Today it runs multi-tenant, multi-team, sometimes multi-customer - yet PromQL has no native authorization model. Anyone with query access can read any label, any metric, any tenant's data.
In this talk, we treat PromQL access like tool invocation in an agentic system: every query is a request that should pass through a policy layer before execution. Drawing on patterns from securing MCP tool calls with Kyverno, we show how to enforce least-privilege querying - label-based tenant isolation, metric name allow/deny lists, and cost-aware rate limiting - without forking Prometheus itself.
We'll live-demo a kind cluster running a policy-enforcing query proxy in front of Prometheus, showing real queries get rewritten, blocked, or rate-limited based on tenant identity - and discuss where this model breaks down (federation, recording rules, dashboards).

### Speakers
[Oshi Gupta](../../speakers/oshi-gupta)

<img src="https://cdn.sessionize.com/image/a9c0-400o400o1-nQXNuwqhsoJGvJTYu7i5Xw.jpg" style="width: 100px; border-radius: 50%" alt="Oshi Gupta Profile Picture"/>

[Neel Shah](../../speakers/neel-shah)

<img src="https://cdn.sessionize.com/image/dc9b-400o400o1-3rkgDovdUZgvanVZHeevzf.jpg" style="width: 100px; border-radius: 50%" alt="Neel Shah Profile Picture"/>

