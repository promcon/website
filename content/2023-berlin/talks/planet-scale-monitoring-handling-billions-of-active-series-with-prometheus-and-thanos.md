---
title: "Planet scale monitoring: Handling billions of active series with Prometheus and Thanos"
---

## Planet scale monitoring: Handling billions of active series with Prometheus and Thanos

Speaker(s): [Sebastian Rabenhorst](../../speakers/sebastian-rabenhorst) & [Mikołaj Liberski](../../speakers/mikolaj-liberski)

Deploying and operating a highly available and distributed Prometheus setup at scale can present significant challenges. In this presentation, we will showcase an example of a globally distributed and highly scalable deployment at Shopify. This setup enables us to ingest billions of active time series with tens of millions of samples per second, coming from thousands of applications running in hundreds of Kubernetes clusters.

The main part of the presentation will cover the architecture of our current solution. We will demonstrate how we use Prometheus agents with custom service discovery to scrape and write metrics into regional Thanos receiver deployments. We will also explain how we leverage Thanos's long-term storage and distributed querying capabilities to enable long-term querying of billions of time series. Additionally, we will provide insight into how thousands of developers can query, explore, and configure their metrics and alerts through a customized Grafana deployment, and how our setup evaluates rules and alerts across our entire metrics dataset.

At the end of the presentation, we will emphasize some of the challenges we encountered during the time-intensive migration from a third-party monitoring vendor to our current solution.
