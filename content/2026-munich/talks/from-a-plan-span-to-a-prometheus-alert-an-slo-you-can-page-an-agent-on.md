---
title: "From a plan span to a Prometheus alert: an SLO you can page an agent on"
---

## From a plan span to a Prometheus alert: an SLO you can page an agent on

AI agents now sit in the critical path of real systems, but we watch them nothing like we watch everything else. An agent run is a sprawling trace: plan, tool call, retry, tool call, reflect. Traces are great for a post mortem and useless for a pager. You cannot alert on a span. You can alert on a metric.

This talk lives on the seam between those two worlds, and it is a Prometheus talk, not an LLM talk. OpenTelemetry's GenAI semantic conventions are starting to give agent behaviour a stable vocabulary. Operations like chat, execute_tool, and the plan step I authored (semantic-conventions-genai#97, accepted upstream in May 2026) become the substrate. I will show how to turn that trace shaped signal into boring, dependable Prometheus time series: how the OpenTelemetry Collector's spanmetrics connector and the OTLP to Prometheus path map an agent's operations onto counters and histograms, where the naming and label rules collide (UTF-8 metric names, the _total and unit suffixes, resource attributes versus labels, the target_info join), and how to stop cardinality exploding when every label wants to be a model name, a tool name, or a run id.

From there we build the metrics that let you treat an agent like any other unreliable dependency: a tool call error rate SLO, a plan to first action latency histogram, a retry storm detector, and a multi window burn rate alert that pages when the agent is failing in a way users feel, not when a single run looks weird. The talk shows the label and cardinality decisions that keep those series bounded on a real fleet, the recording rules and burn rate alerts, and how the same series federate through Thanos across clusters. Everything runs on open source components, and it comes with a runnable repo of the Collector config, the recording rules, and a before and after Grafana dashboard so you can reproduce the pipeline.

You will leave able to instrument an agent with OpenTelemetry and get Prometheus SLOs and alerts out the other end, using only the query language and conventions this room already knows.

Outline (25 to 30 minutes):
1. The mismatch (4 min). Why agent observability defaulted to traces and eval dashboards, and why on call still cannot page on any of it. An agent is a dependency, and dependencies need SLOs.
2. The vocabulary (4 min). The OpenTelemetry GenAI semantic conventions from a metrics lens: gen_ai.operation.name (chat, execute_tool, and the plan step I authored), which attributes are stable, and which are cardinality traps.
3. Trace to time series (7 min). The pipeline: the OpenTelemetry Collector spanmetrics connector and the OTLP to Prometheus mapping. The interop sharp edges Prometheus users hit, including UTF-8 metric and label names, the _total and unit suffixes, resource attributes versus labels, and the target_info and info() join. Live PromQL against the resulting series.
4. Metrics that mean something (6 min). Four agent reliability signals: tool call error rate, plan to first action latency histogram, retry storm rate, and cost and token counters, each with a cardinality budget that survives production, including the run id decision that keeps the series count bounded.
5. SLOs, alerts, and fleets (6 min). Recording rules, multi window multi burn rate alerts on an agent SLO, and federating agent fleets through Thanos. What actually paged us, and what we deliberately chose not to page on.
6. Takeaways and pitfalls (3 min). The interop sharp edges to avoid, plus the runnable repo so you can instrument your own agent this week.

Key takeaways:
1. Traces debug, metrics page. An AI agent is just another unreliable dependency, and you can give it a real Prometheus SLO and multi window burn rate alert instead of staring at eval dashboards.
2. The OpenTelemetry to Prometheus seam has specific, knowable sharp edges: UTF-8 names, the _total and unit suffixes, resource attribute to label mapping, the target_info join, and cardinality from model, tool, and run id labels. Each one has a concrete mitigation, and the label choices decide whether your series count stays bounded or explodes.
3. The OpenTelemetry GenAI semantic conventions (chat, execute_tool, plan) plus the Collector's spanmetrics path give you portable, vendor neutral agent reliability series that federate through Thanos exactly like the rest of your fleet, all reproducible from the runnable repo shipped with the talk.


### Speakers
[Krishna Chaitanya](../../speakers/krishna-chaitanya)

<img src="https://cdn.sessionize.com/image/9427-400o400o1-3EJdwPYrGWHFtciPjtR9on.jpg" style="width: 100px; border-radius: 50%" alt="Krishna Chaitanya Profile Picture"/>

