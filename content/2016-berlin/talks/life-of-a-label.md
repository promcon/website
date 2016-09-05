---
title: Life of a Label
kind: talk
---

## Life of a Label

Labels are at the core of Prometheus's dimensional data model. The Prometheus
server and its surrounding ecosystem components all either attach, modify, or
act on labels in various ways. In this talk, Brian explains the entire life
cycle of labels, including their generation in the client libraries, their
transformation in relabeling, as well as their use in service discovery and
alerting.
