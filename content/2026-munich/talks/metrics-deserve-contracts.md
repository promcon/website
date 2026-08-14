---
title: "Metrics deserve contracts"
---

## Metrics deserve contracts

Observability has been running on conventions for fifteen years. Metric names mean something to a producer, something else to a consumer, and the agreement between them lives in tribal knowledge and dashboards. Every name change exposes the gap, and names change all the time. An exporter upgrade quietly renames a metric, and dashboards go dark. A team iterates on its instrumentation, and last quarter's alert stops firing. OpenTelemetry bumps a semantic convention, and every downstream query referencing the old name is on its own.

Data engineering solved this years ago with data contracts, formal, enforceable agreements between producers and consumers. Observability hasn't.

This talk argues that Prometheus should become the first open-source metrics ecosystem where data contracts travel with the data, declared at emit time and respected at read time.                 

Versioned semantic conventions. What it means for a metric to span an OTel semconv rename and still be queried as one thing, under the requested version's contract. We'll walk through a working proof of concept and what it teaches us about enforcement.

OTLP translation strategies. The same shape applied to a different rename dimension: a query at one translation strategy should surface samples produced under any other.

Prometheus signs its own contracts. Where this goes next: /metrics ships an OTel-format schema describing Prometheus's own renames; exporters follow; tooling validates that the wire honors the contract.

### Speakers
[Nicolas Takashi](../../speakers/nicolas-takashi)

<img src="https://cdn.sessionize.com/image/daf0-400o400o1-3gnPRAeMjm5t5PhrZ5FAbH.jpg" style="width: 100px; border-radius: 50%" alt="Nicolas Takashi Profile Picture"/>

[Arve Knudsen](../../speakers/arve-knudsen)

<img src="https://cdn.sessionize.com/image/eda9-400o400o1-fFNkViNmjhiRjXSV5PyZuG.jpg" style="width: 100px; border-radius: 50%" alt="Arve Knudsen Profile Picture"/>

