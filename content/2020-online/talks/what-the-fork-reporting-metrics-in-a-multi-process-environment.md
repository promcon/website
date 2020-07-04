---
title:  What the fork‽ Reporting metrics in a multi-process environment
---

## What the fork‽ Reporting metrics in a multi-process environment

Speaker: [Daniel Magliola](/2020-online/speakers/daniel-magliola/)

For many years, most Ruby applications couldn't use Prometheus, because the Ruby client didn't support pre-fork servers.

It turns out this wasn't solved for such a long time because it's a surprisingly hard problem.

Many have tried to solve this with different approaches, but we found the best one to be the simplest.

Let me show you the dark arts of inter-process communication, and how we ended up fully supporting metrics in Ruby.
