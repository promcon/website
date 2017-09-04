---
title: Storing 16 Bytes at Scale
---

## Storing 16 Bytes at Scale

Speaker: [Fabian Reinartz](/2017-munich/speakers/fabian-reinartz/)

From the beginning, Prometheus was built as a monitoring system with Cloud Native environments in mind. Orchestration systems such as Kubernetes are rapidly gaining traction and unlock features of highly dynamic environments, such as frequent rolling updates and auto-scaling, for everyone. This inevitably puts new strains on Prometheus as well.

In this talk we explore what these challenges are and how we are addressing them by building a new storage layer from the ground up. The new design provides efficient indexing techniques that gracefully handle high turnover rates of monitoring targets and provide consistent query performance. At the same time, it significantly reduces resource requirements and paves the way for advanced features like hot backups and dynamic retention policies.

<iframe width="560" height="315" src="https://www.youtube.com/embed/b_pEevMAC3I" frameborder="0" allowfullscreen></iframe>

[Video link](https://youtu.be/b_pEevMAC3I) -
[Slides](/2017-munich/slides/storing-16-bytes-at-scale.pdf)
