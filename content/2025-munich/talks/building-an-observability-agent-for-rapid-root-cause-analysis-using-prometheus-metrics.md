---
title: "Building an Observability Agent for Rapid Root Cause Analysis using Prometheus metrics"
---

## Building an Observability Agent for Rapid Root Cause Analysis using Prometheus metrics

Summary

This talk demonstrates how to build a Prometheus-focused observability agent that intelligently analyzes Prometheus metrics alongside supplementary telemetry (logs and traces from OpenSearch) to quickly identify and troubleshoot issues. We present a practical, metrics-driven approach leveraging MCP (Model Context Protocol) servers for smarter, faster root cause analysis.

Description

Effective observability begins with metrics. However, metrics alone may lack critical context to fully explain incidents. This talk explores a practical solution—a Prometheus-centric observability agent enhanced by correlated telemetry stored in OpenSearch.

We highlight a real-world scenario where metrics are collected using OpenTelemetry and stored in Prometheus, while logs and traces are stored in OpenSearch. The observability agent leverages the Model Context Protocol (MCP) server to intelligently interpret Prometheus metrics and access supplemental telemetry to rapidly pinpoint underlying problems.

The session will highlight:

* Architecture of an observability agent designed to utilize Prometheus metrics
* Utilizing MCP servers to provide additional contextual insights
* A demonstration illustrating rapid root-cause identification and resolution workflows using this metrics-first approach.

Participants will learn actionable strategies to improve observability and significantly reduce mean-time-to-resolution.


### Speakers
[Pavan Yekbote](../../speakers/pavan-yekbote)

<img src="https://sessionize.com/image/bef3-400o400o1-YKEAsk8JKD3cScVatXqtvs.jpg" style="width: 100px; border-radius: 50%" alt="Pavan Yekbote Profile Picture"/>

