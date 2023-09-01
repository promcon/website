---
title: "How to Monitor Global Tens of Thousands of Kubernetes Clusters with Thanos Federation"
---

## How to Monitor Global Tens of Thousands of Kubernetes Clusters with Thanos Federation

Speaker(s): [Jiaxu Liu](../../speakers/jiaxu-liu)

Thanos is a CNCF project that builds upon Prometheus to create a global highly available monitoring system. Alibaba Cloud Kubernetes (ACK) is a managed Kubernetes product providing containerized application service. The current deployment has tens of thousands of Kubernetes clusters across over 30 regions globally, and ALL are monitored by Prometheus with Thanos federation, using 400+ Prometheus servers globally, with over 4 billion of active time series. This talk will cover Alibaba's best practices in production, including multiple-region architecture design for Prometheus with Thanos federation, considering both scalability and high availability. Key optimizations, such as tuning and optimization for a global view, optimal resource calculation, essential cost-saving, etc., will also be discussed. Furthermore, the talk will highlight the benefits for business scenarios in Alibaba Cloud, such as Thanos-based cluster scalability, cluster introspection, and BI. With the help of this talk, users can easily set up a global Thanos system for large-scale clusters and gain benefits for various business scenarios.
