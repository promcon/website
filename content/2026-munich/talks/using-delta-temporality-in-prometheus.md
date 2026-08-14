---
title: "Using Delta Temporality in Prometheus"
---

## Using Delta Temporality in Prometheus

As part of increasing the compatibility between Prometheus and Open Telemetry, we have implemented native support for Delta Temporality Metrics in Prometheus. This new data type has implications both for Prometheus developers and for users interested in recording delta metrics. This talk will start by touching on the implementation details and then spend most of the time on the end-user experience.

The implementation portion will explain the chosen implementation of recording Start Time per Sample and give an overview of how it was implemented in Prometheus WAL, tsdb, and Query engine.

The second section will cover the practicalities of using delta temporality metrics: how to enable the features, how to confirm that start times are being correctly recorded, using new query functions, and methods of debugging start times.

### Speakers
[Owen Williams](../../speakers/owen-williams)

<img src="https://cdn.sessionize.com/image/6b38-400o400o1-wGCbhnjGXPkCZrh57tsMQF.jpg" style="width: 100px; border-radius: 50%" alt="Owen Williams Profile Picture"/>

