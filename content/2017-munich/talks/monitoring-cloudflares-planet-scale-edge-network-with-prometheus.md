---
title: Monitoring Cloudflare's Planet-Scale Edge Network with Prometheus
---

## Monitoring Cloudflare's Planet-Scale Edge Network with Prometheus

Speaker: [Matt Bostock](/2017-munich/speakers/matt-bostock/)

Cloudflare operates a global anycast edge network serving content for 6 million web sites. This talk explains how we monitor our network, how we migrated from Nagios to Prometheus and the architecture we chose to provide maximum reliability for monitoring. We'll also discuss the impact of alert fatigue and how we reduced alert noise by analysing data, making alerts more actionable and alerting on symptoms rather than causes.

This talk will cover:

- The challenges of monitoring a high volume, anycast, edge network across 100+ locations
- The architecture we chose to maximise the reliability of our monitoring
- Why Prometheus excels as the new industry standard for modern monitoring
- Approaches for reducing alert noise and alert fatigue
- Triaging alerts into a ticket system
- Analysing past alert data for continuous improvement
- The pain points we endured
- How to effect change across all engineering teams
