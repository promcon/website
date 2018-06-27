---
title: Thanos - Prometheus at Scale
---

## Thanos - Prometheus at Scale

Speakers:

* [Bartłomiej Płotka](/2018-munich/speakers/bartek-plotka/)
* [Fabian Reinartz](/2018-munich/speakers/fabian-reinartz/)

The Prometheus Monitoring system has been thriving for several years. Along with its powerful data model, operational simplicity and reliability have been a key factor in its success. However, some questions were still largely unaddressed to this day. How can we store historical data at the order of petabytes in a reliable and cost-efficient way? Can we do so without sacrificing responsive query times? And what about a global view of all our metrics and transparent handling of HA setups?

Thanos takes Prometheus' strong foundations and extends it into a clustered, yet coordination free, globally scalable metric system. It retains Prometheus's simple operational model and even simplifies deployments further. Under the hood, Thanos uses highly cost-efficient object storage that's available in virtually all environments today. By building directly on top of the storage format introduced with Prometheus 2.0, Thanos achieves near real-time responsiveness even for cold queries against historical data. All while having virtually no cost overhead beyond that of the underlying object storage.

We will show the theoretical concepts behind Thanos and demonstrate how it seamlessly integrates into existing Prometheus setups.
