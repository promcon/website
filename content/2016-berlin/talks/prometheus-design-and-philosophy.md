---
title: Prometheus Design and Philosophy
kind: talk
---

## Prometheus Design and Philosophy

Prometheus is an opinionated monitoring system that chooses to do a lot of
things differently from traditional monitoring systems. This leads to a
culture clash for those used to other approaches, and raises questions as to
why we didn't take a seemingly better approach. This talk focuses on the "why"
behind many of the design decisions that are core to Prometheus, including
pull vs. push, the dimensional data model, relabeling, per-process exporters,
stateful client libraries, as well as aspects like metric naming conventions
and having a non-distributed storage as a design goal.
