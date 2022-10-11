---
title: "OSS Supply Chain - Are Prometheus Exporters the Weak Link?"
---

## OSS Supply Chain - Are Prometheus Exporters the Weak Link?

Speaker(s): [David de Torres Huerta](../../speakers/david-de-torres-huerta)

The supply chain in open source projects has become the elephant in the room of every ecosystem, and Prometheus is no exception. However, Prometheus is not just one project but a large open-source ecosystem of projects: the exporters. And the majority of these exporters are beyond the scope of the main Prometheus project and community.

The reason for this is that few applications provide out-of-the-box Prometheus metrics, and we can see how the original idea of allowing the open-source community to create Prometheus exporters at will has resulted in a heterogeneous ecosystem in which:

* You can find more than one exporter for the same application
* Configurations are not homogeneous
* Prometheus best practices and conventions are not always followed

Most crucially, the majority of them are independent open source projects maintained by independent open source contributors. They may or may not continue with the project with the degree of security and performance necessary for production environments in the future.

In this talk, we will explore the potential risk of exporters in the Prometheus supply chain and some ideas of how to improve our ecosystem.

