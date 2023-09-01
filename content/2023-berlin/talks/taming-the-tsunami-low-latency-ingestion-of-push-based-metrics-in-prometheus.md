---
title: "Taming the Tsunami: low latency ingestion of push-based metrics in Prometheus"
---

## Taming the Tsunami: low latency ingestion of push-based metrics in Prometheus

Speaker(s): [Filip Petkovski](../../speakers/filip-petkovski) & [Pedro Tanaka](../../speakers/pedro-tanaka)

Adopting an effective strategy for capturing metric data is a critical aspect of managing large-scale operations. At Shopify, our journey involved integrating push-based metrics into a Prometheus-based system, a challenge imposed by our applications that were already instrumented with Statsd.

In this talk, we will share our journey of scaling our metric pipeline using a push-based approach and integrating it into a system that serves thousands of applications with throughput on the order of Gigabytes per second. We'll delve into the benefits and challenges of push-based monitoring, offering insights into why it made sense in our context, despite being less conventional in the Prometheus community. In addition, we will discuss the introduction of native histograms in Prometheus 2.40 and how it significantly contributed to our success.

Lastly, we will provide an in-depth overview of our pipeline's architecture, focusing on the role of our custom-built Statsd Load Balancer and the adapted Statsd Exporter, an open-source tool from the creators of Prometheus. These key components have allowed us to effectively manage high cardinality metrics in a cost-effective manner, something which is still quite challenging with a pull-based approach. If you're managing a Prometheus stack with applications using push-based instrumentation, this talk could provide a fresh perspective and valuable insights.
