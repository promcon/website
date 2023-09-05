---
title: "Towards making Prometheus OpenTelemetry native"
---

## Towards making Prometheus OpenTelemetry native

Speaker(s): [Goutham Veeramachaneni](../../speakers/goutham-veeramachaneni) & [Jesús Vázquez](../../speakers/jesus-vasquez)

OpenTelemetry is coming up as the emerging standard for instrumenting and transporting telemetry data. There is good integration between Prometheus and OpenTelemetry, with the conversion between the two as part of the OpenTelemetry specification.

However, the query experience and overall the usability of Prometheus when being used as an OTel metrics backend is quite lacking. The Prometheus community is working towards bridging the gaps and making sure that Prometheus is the best backend for OpenTelemetry metrics.

In this talk, we will present the current state and the solutions being implemented right now to address some of them. We will also present the longer road-map which will address some of the fundamental datamodel issues, putting us on the path to become 100% OTel native without compromising on the Pull model and what made Prometheus great.
