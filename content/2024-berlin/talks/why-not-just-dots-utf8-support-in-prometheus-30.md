---
title: "Why Not Just Dots? UTF-8 Support in Prometheus 3.0"
---

## Why Not Just Dots? UTF-8 Support in Prometheus 3.0

Speaker(s): [Owen Williams](../../speakers/owen-williams)

An overview of the design and implementation of UTF-8 support for metric and label names in Prometheus. The talk will detail the genesis of the new quoting syntax, as well as why the chosen approach didn't simply add dots as a new valid character. The talk will also cover how Prometheus maintains compatibility with older systems and will support metric name migrations.