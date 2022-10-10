---
title: "MaaS for the masses: Build Your Monitoring-as-a-Service (MaaS) Solution With Prometheus"
---

## MaaS for the masses: Build Your Monitoring-as-a-Service (MaaS) Solution With Prometheus

Speaker(s): [Saswata Mukherjee](../../speakers/saswata-mukherjee) & [Matej Gera](../../speakers/matej-gera)

Patterns of operating Prometheus-based monitoring solutions are changing steadily. More and more organizations want to leverage the Prometheus data model with all its capabilities and offer it to their users without an operational burden in a centralized manner. This is often motivated by the need to deal with issues such as abstracting away complexities, managing costs, resiliency, and security. Having to implement the same best practices and know-how, learned from running Prometheus, while dealing with multiple teams, products, and environments can quickly become a daunting task.

Prometheus provides us with well-grounded and stable foundations to expand its functionality to monitoring-as-a-service (MaaS). However, achieving this on the TSDB data model, with remote client-controlled environments, poses some unique challenges.  With this paradigm shift, we now need to consider aspects such as authentication, authorization, rate limiting, allow-listing, and tenancy. 

In this talk, you will learn how to leverage Prometheus and its ecosystem to implement functional MaaS for your needs. Matej and Saswata will discuss several state-of-the-art open source solutions, ranging from using a simple proxy to deploying a fully-fledged multi-tenancy system like Prometheus in receive mode, Thanos, Cortex, and Mimir. They will also talk about the challenges faced and the future work ahead.
