---
id: tindex_how_to_not_drown_in_time_series
title: "Tindex: How to Not Drown in Time Series?"
kind: talk
---

## Tindex: How to Not Drown in Time Series?

At its core the Prometheus storage is about handling time series – millions of
them. With the rise of cluster management systems like Kubernetes, the
environments we monitor become more dynamic every day. As we still want to be
able to drill down into all past and present aspects of our systems, this
means means millions of *new* time series – every day.

This imposes a hard problem on the storage to index and look up time series
quickly. In this talk, we explore an approach to solve this problem to prepare
Prometheus for the years ahead.
