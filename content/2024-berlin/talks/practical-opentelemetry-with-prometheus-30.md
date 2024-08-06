---
title: "Practical OpenTelemetry with Prometheus 3.0"
---

## Practical OpenTelemetry with Prometheus 3.0

Speaker(s): [Arve Knudsen](../../speakers/arve-knudsen) & [Jesus Vazquez](../../speakers/jesus-vazquez)

A lot of hard work has gone into making Prometheus 3.0 a great OpenTelemetry (OTel) metrics store. In this talk we dive into the new features and what you need to effectively store and query OTel data inside Prometheus.

OTLP ingestion is now GA.

* This means no more feature flag. But you need to enable it via another flag.
* This means we are committed to making this work at scale and is a major focus of future development.
* OTLP performance has been improved massively:
   * Benchmarks show ~49% faster request translation on average.
* Effectively storing and querying OTLP data
   * To make OTLP useful, copy some resource attributes. Here is a good starting list.
   * Don't copy too many as it will cause issues.
   * To make this even more seamless, there is the experimental info function.
   * Proper metadata storage is being worked on too.
* Support for delta temporality
   * OTLP is not just cumulative, but there is not the delta to cumulative processor to help convert your deltas before storing.
   * Proper support for delta in Prometheus is being worked on as well.
* A community mixin for popular semantic conventions
   * There is also a community mixin now available (TBD but will likely exist by Sept.)

3.0 is not the end, we are actively working on more improvements. Our goal is to make Prometheus the best OSS store for OTel metrics.

* up metric implementation in push
* . in metric names and how that'll look like
