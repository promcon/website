---
title: "When my Counter Restarted? Addressing Decade-Old Counter Limitation With Created Timestamps"
---

## When my Counter Restarted? Addressing Decade-Old Counter Limitation With Created Timestamps

Speaker(s): [Arthur Silva Sens](../../speakers/arthur-silva-sens) & [Bartłomiej Płotka](../../speakers/bartlomiej-plotka)

Prometheus counters are one of the most useful metric types. Thanks to cumulative characteristics and simple semantics, they allow cheap and reliable rate calculations, even with missed scrapes. But what if we tell you that your rates sometimes might deceive you?

Fear not! In this talk, the audience will learn about the latest development in the Prometheus ecosystem that fixes these decade-old precision issues with counters. By supporting created timestamp, Prometheus can now accurately deduce the start times for each stream of samples.

Arthur and Bartek will explain how created timestamps are integrated with Prometheus and how you can leverage them in your production systems. Increase the reliability of queries and alerts against counter today!
