---
title: "OpenTelemetry developments in Prometheus over the last year"
---

## OpenTelemetry developments in Prometheus over the last year

Since last year's PromCon, there have been numerous improvements to Prometheus' OpenTelemetry support, more specifically its OTLP receiver. Among them:

* Converting OpenTelemetry metric metadata to Prometheus equivalent
* Support for keeping identifying attributes in the target_info metric
* Primitive support for ingesting OpenTelemetry delta temporality metrics without converting to cumulative
* Support for ingesting OpenTelemetry metrics without translating metric or attribute names
* Support for translating OpenTelemetry explicit bucket histograms into native histograms with custom buckets
* Promote OpenTelemetry scope metadata to metric labels

Carrie and Arve will, as core contributors to the Prometheus OTLP receiver, give an introduction to the most important improvements that have been made to Prometheus' OpenTelemetry support over the last year.


### Speakers
[Arve Knudsen](../../speakers/arve-knudsen)

<img src="https://sessionize.com/image/eda9-400o400o1-fFNkViNmjhiRjXSV5PyZuG.jpg" style="width: 100px; border-radius: 50%" alt="Arve Knudsen Profile Picture"/>

[Carrie Edwards](../../speakers/carrie-edwards)

<img src="https://sessionize.com/image/0f8b-400o400o1-HKdRFE5M6BimTbXex7SYwo.jpg" style="width: 100px; border-radius: 50%" alt="Carrie Edwards Profile Picture"/>

