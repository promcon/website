---
title: "OTEL delta temporality support in Prometheus"
---

## OTEL delta temporality support in Prometheus

OpenTelemetry's metric model natively supports both delta and cumulative temporality, while Prometheus has historically only supported cumulative. In the past, this meant any delta metrics attempted to be ingested via Prometheus' OTLP endpoint were rejected. More recently however, there has been progress with delta support in Prometheus to improve OTEL interoperability. 

This talk will explore the journey of OTEL delta metric support in Prometheus: the historical context, current state, and potential future steps, highlighting the challenges encountered and open questions that remain.

### Speakers
[Fiona Liao](../../speakers/fiona-liao)

<img src="https://sessionize.com/image/d768-400o400o1-H7rRPPDpCqoT8SPsXqM4su.jpg" style="width: 100px; border-radius: 50%" alt="Fiona Liao Profile Picture"/>

