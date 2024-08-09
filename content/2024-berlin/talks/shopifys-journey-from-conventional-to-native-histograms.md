---
title: "Shopify's journey from conventional to native histograms"
---

## Shopify's journey from conventional to native histograms

Speaker(s): [Sebastian Rabenhorst](../../speakers/sebastian-rabenhorst) & [Pedro Tanaka](../../speakers/pedro-tanaka)

At Shopify, we've implemented a Thanos-based solution for monitoring hundreds of clusters and thousands of applications, which primarily use StatsD metrics with a heavy reliance on histograms.

In this talk we will present how and why we migrated our backend, user dashboards and alerts from conventional to native histograms and we will highlight how the composition of our clients' metrics, primarily histograms, served as the driving force behind our migration. We will elaborate what problems the migration solved and the new challenges it presented to us and how we did it with minimal impact on our users. 
Furthermore, we will provide insights into our contributions to Thanos, with a focus on the implementation of native histogram support.
