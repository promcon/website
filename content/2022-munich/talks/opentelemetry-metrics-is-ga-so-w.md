---
title: "OpenTelemetry Metrics is GA, so what?"
---

## OpenTelemetry Metrics is GA, so what?

Speaker(s): [James Guthrie](../../speakers/james-guthrie)

The OpenTelemetry Metrics data model was recently stabilized, but most of you will ask yourselves "Why should I care? I’m already using Prometheus".

In this talk, we'll gain valuable insights into what’s new and different in OpenTelemetry Metrics, and the kinds of issues that you might encounter when trying to store and query both OTel and Prometheus data. We'll start by looking into which options you have to integrate OTel Metrics in your existing monitoring stack. Then we'll look at differences between the Prometheus and OpenTelemetry's metric types, how sums are different from counters, and why some sums are monotonic and some aren’t. We'll cover the tradeoffs between delta and cumulative temporality for Sums and Histograms in terms of both collection and analysis. Finally, we'll cover resets and gaps and how an explicit start time helps create more accurate analysis.

At the end of this talk, you'll be prepared to handle OpenTelementry metrics in your monitoring setup.

