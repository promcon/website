---
title: Full Stack Metrics with Triton's Native Prometheus Support
kind: talk
---

## Full Stack Metrics with Triton's Native Prometheus Support

Triton is the open source data center automation solution that powers public
cloud and private data centers world-wide. In early 2016, Joyent undertook a
project to expose infrastructure and system for every instance — including
infrastructure containers, Docker containers, and hardware virtual machines —
using a Prometheus-compatible agent. The project, called Triton Container
Monitor and described in our public request for discussion,
https://github.com/joyent/rfd/blob/master/rfd/0027/README.md, takes advantage
of container-native architecture, kstats, and other native introspection
tools.

Additionally, developers need tools to expose up-stack application metrics to
Prometheus. ContainerPilot, the open source, application-centric
micro-orchestrator that makes it easy to build and operate portable
application containers, now features a Prometheus-compatible telemetry
interface to monitor application performance with user-defined probes. This
interface brings monitoring directly to the container and eliminates the
dependence on complex host monitoring for application-specific details.

In this session, Container Monitor lead engineer Richard Kiene will discuss
the challenges and successes of implementing Prometheus as a native interface
in Triton, and ContainerPilot lead engineer Tim Gross will demonstrate
ContainerPilot telemetry and discuss the application-level decisions around
defining metrics to drive application scaling.

<%= youtube_player "X8QV9HgPNbc" %>
<%= speakerdeck_player "ceeedb31ae474ccc8c078c5c9d6a3dd2" %>
