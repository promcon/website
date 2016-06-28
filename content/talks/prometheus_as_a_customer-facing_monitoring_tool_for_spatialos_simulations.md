---
id: prometheus_as_a_customer-facing_monitoring_tool_for_spatialos_simulations
title: Prometheus as a Customer-Facing Monitoring Tool for SpatialOS Simulations
kind: talk
---

## Prometheus as a Customer-Facing Monitoring Tool for SpatialOS Simulations

At Improbable we provide a platform for spatially distributed simulations to
our customers. We use Prometheus for monitoring our internal microservice
stack, but also offer it as a first class customer-facing system on our
platform. As far as we know, we are currently running one of the largest
Prometheus set ups, with multiple clusters of federated Prometheus stacks.
Given the nature of the simulations built by our users, monitoring becomes
their go-to tool for debugging and troubleshooting. Since our customer facing
Prometheus stack is multitenant, we have also implemented monitoring data
isolation based on ACLs.

In this talk we will be discussing our federation set up and monitoring data
isolation.
