---
title: "Sharing is Caring: Leveraging Open Source to Improve Cortex & Thanos"
---

## Sharing is Caring: Leveraging Open Source to Improve Cortex & Thanos

Speaker: [Bartłomiej Płotka](/2020-online/speakers/bartlomiej-plotka/)
Speaker: [Marco Pracucci](/2020-online/speakers/marco-pracucci/)

Perhaps some of the success of the original Prometheus project can be attributed to the desire to keep it simple: no dependencies, no trendy distributed systems, a single binary with a simple mission.

This approach left some problems unsolved - how do you scale your Prometheus installation across multiple sites? How do you ensure your metrics are durably stored for long term analysis? And how do you build a monitoring system that can transparently tolerate machine failure?

Once upon a time, two open source projects were created to solve those problems at scale: Cortex and Thanos. Originally designed with a totally different architecture and trade-offs but for the same goals. Because of open source, over time, both projects were observing and started to learn from each other. Both started influencing each other with ideas and improvements. Today Cortex and Thanos are closer than ever, with a tight collaboration which is making their architectures converge and evolve, significantly improving both projects and influencing the Prometheus ecosystem on the way!

In this talk, you will learn why those two potentially competing CNCF projects are working together and where this is heading! Marco (Cortex maintainer)and Bartek (Thanos co-author) will explain how Cortex and Thanos leverage open source to collaborate better, without introducing maintenance burden. We will cover the cutting edge state of both projects and the most recent wins thanks to the joint effort, showing the pillars of the open source: sharing and caring!
