---
title: "Agile Monitoring At Scale With Thanos"
---

## Agile Monitoring At Scale With Thanos

A Prometheus environment is not cloud-specific. It extends beyond Kubernetes setups and in fact, it was not designed to be. It is not cloud-bound. The Prometheus ecosystem adapts to your unique needs, leveraging the breadth of your knowledge and skills. It is supposed to facilitate the need for visibility of the SRE team, not a particular environment or a project.

This is why, in MariaDB, we've created a Core Monitoring system based on Prometheus, Thanos, and Grafana that is as close to the SRE team as possible. It scales with the team's needs up and down from PoC to monitoring 1000+ Kubernetes clusters, simple cloud VMs, and potentially on-prem setups.

In this lecture, I will discuss the modifications that this system has undergone, including data migrations, topology changes, the shift from single to multi-tenancy, and plans for future hybrid cloud and on-premises environments. 

The key takeaway will be how Prometheus can scale with your needs and remain as agile as necessary.


### Speakers
[Mihail Mihaylov](../../speakers/mihail-mihaylov)

<img src="https://sessionize.com/image/3cd6-400o400o1-ULcKdtVTWi7ZrbN9Ybpb2D.jpg" style="width: 100px; border-radius: 50%" alt="Mihail Mihaylov Profile Picture"/>

