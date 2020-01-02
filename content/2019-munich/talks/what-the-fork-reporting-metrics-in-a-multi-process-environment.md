---
title: What the Fork‽ Reporting Metrics in a Multi-process Environment
---

## What the Fork‽ Reporting Metrics in a Multi-process Environment

Speaker: [Daniel Magliola](/2019-munich/speakers/daniel-magliola/)


For many years, most Ruby applications couldn't use Prometheus, because the Ruby client didn't support pre-fork servers. It turns out this wasn't solved for such a long time because it's a surprisingly hard problem. Many have tried to solve this with different approaches, but we found the best one to be the simplest. Let me show you the dark arts of inter-process communication, and how we ended up fully supporting metrics in Ruby.

<%= youtube_player("Or_LMxyHwWY") %>

[Video link](https://youtu.be/Or_LMxyHwWY) -
[Slides](/2019-munich/slides/what-the-fork-reporting-metrics-in-a-multi-process-environment.pdf)
