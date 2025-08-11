---
title: "A History of Automatic Aggregations"
---

## A History of Automatic Aggregations

At Criteo, we’ve relied on automatic aggregations for years. “Automatic aggregation” is the name we give to a system of recording rules that matches most metrics and removes certain dimensions, such as the instance emitting the metric, to reduce the cardinality (i.e. the number of metrics) and thus making queries faster.

What started as a workaround has become a key part of how we ensure backend stability and reliability at scale, with hundreds of millions of active metrics, all without requiring users to write a single recording rule. It also significantly reduces the cost of metrics storage. Internally, we call this approach zero-effort Observability, as most teams don’t have to write/maintain recording rules.

In this talk, I’ll walk through how our approach to automatic aggregations has evolved over time, and how we’ve adapted it to fit naturally into our Prometheus-based stack. I’ll share the different implementations we’ve tried, the lessons we’ve learned, and how our latest version takes advantage of recent improvements in Prometheus (new __type__ label) .

### Speakers
[Raphaël Bizos](../../speakers/raphaël-bizos)

<img src="https://sessionize.com/image/b011-400o400o1-W94J6vBS9WEBaaNC5FpAVu.jpg" style="width: 100px; border-radius: 50%" alt="Raphaël Bizos Profile Picture"/>

