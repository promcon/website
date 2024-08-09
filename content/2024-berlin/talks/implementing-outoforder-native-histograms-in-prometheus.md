---
title: "Implementing Out-of-Order Native Histograms in Prometheus"
---

## Implementing Out-of-Order Native Histograms in Prometheus

Speaker(s): [Carrie Edwards](../../speakers/carrie-edwards) & [Fiona Liao](../../speakers/fiona-liao)

Support for out-of-order ingestion of float samples was introduced in Prometheus v2.39.0. With the introduction of native histograms in Prometheus 2.41.0, it was necessary to adapt the TSDB’s handling of out-of-order samples in order to support native histograms.

In this talk, we will tell the story of how we made our first substantial contribution to Prometheus by adding support for out-of-order ingestion of native histograms, and dive into the challenges and changes required in the TSDB to make this happen.

The audience will learn the internals of out-of-order ingestion, native histograms and the challenges of the implementation of ingesting OOO native histograms. We will also share our process of getting familiarized with the TSDB, and hopefully encourage others to contribute to Prometheus.
