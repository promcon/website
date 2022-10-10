---
title: "Centralized vs. Decentralized - How DoorDash Collects Prometheus Metrics"
---

## Centralized vs. Decentralized - How DoorDash Collects Prometheus Metrics

Speaker(s): [Eric D. Schabell](../../speakers/eric-d-schabell) & [Emma (Qixuan) Wang](../../speakers/emma-(qixuan)-wang)

There are two primary approaches to scrape and collect metrics using Prometheus - using a centralized set of dedicated scrapers or decentralized scrapers that run as an agent. With centralized scraping, Prometheus is deployed as a central scraper to pull metrics from all discoverable endpoints and sometimes can be split across multiple centralized instances using a few different approaches. However, with a decentralized approach, Prometheus runs as an agent, in Kubernetes is deployed as a DaemonSet on each node in a cluster, and only collects metrics from the node it runs on. Each model has pros and cons - especially when operating at large scale - which can make it difficult when deciding which model to use.  

In this session, Emma and Eric will provide an overview of Prometheus metrics collection at DoorDash, where having highly reliable resources, easy endpoint discovery, and real-time insights is critical. They will share insights and best practices into DoorDash’s decision to implement a decentralized model by offering pros and cons of each approach. Leave with a better understanding of the “right” model for your use case(s).

