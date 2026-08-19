---
title: "From Buckets to Native Histograms: Lessons from a Production Migration"
---

## From Buckets to Native Histograms: Lessons from a Production Migration

Prometheus 3.x finally gives us the tools to make native histogram migrations practical. Features like per-target relabeling, dual scraping of classic and native histograms, improved rate calculations, and performance optimizations mean we no longer have to choose between a risky "big bang" migration or staying on classic histograms forever.

But having the tooling is only half the story.

What does a real migration actually look like? What breaks? What catches teams off guard? And how do you convince everyone that their dashboards aren't broken when their p99 suddenly looks different?

In this session, I'll walk through an end-to-end migration based on real production scenarios—not just the happy path from the documentation. We'll look at how to migrate gradually by running classic and native histograms side by side, validate that both produce the results you expect, and know when it's safe to switch over.

Along the way, we'll explore how the new Prometheus 3.x capabilities make this possible, compare how latency graphs change with the newer rate calculations, and look at the performance improvements in the storage layer, including the latest WAL and TSDB optimizations.

We'll also spend time on the less glamorous parts of migration: Grafana dashboards that suddenly look unfamiliar, exporters that aren't quite ready, and the conversations you'll inevitably have when someone says, "Our latency metrics are wrong."

By the end of the session, you'll have a practical migration strategy, a set of validation techniques you can use in your own environment, and a realistic understanding of both the benefits and the challenges of moving to native histograms.

By the end of this session, attendees will be able to:

Plan a phased migration from classic to native histograms with minimal risk.
Validate native histograms using practical PromQL before production rollout.
Understand how Prometheus 3.x changes scraping, storage, and query behavior.
Avoid common migration pitfalls in dashboards, alerts, and exporters.
Communicate why latency metrics may change after migration and why they're more accurate.

### Speakers
[Shivani Rathod](../../speakers/shivani-rathod)

<img src="https://cdn.sessionize.com/image/d69f-400o400o1-VpkGt1sLSZ13sREg6iDQFW.png" style="width: 100px; border-radius: 50%" alt="Shivani Rathod Profile Picture"/>

[Rushabh Shah](../../speakers/rushabh-shah)

<img src="https://cdn.sessionize.com/image/c525-400o400o1-42tN9v4K6tYH2jA2mRJeh2.png" style="width: 100px; border-radius: 50%" alt="Rushabh Shah Profile Picture"/>

