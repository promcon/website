---
title: "Learning from Mistakes - Choosing the Right Metrics for Prometheus Alerting"
---

## Learning from Mistakes - Choosing the Right Metrics for Prometheus Alerting

Speaker(s): [Ankur Rawal](../../speakers/ankur-rawal) & [Dheeraj Reddy](../../speakers/dheeraj-reddy)

> Evolution forged the entirety of sentient life on this planet using only one tool: the mistake.

We analysed the incident data of 150+ highly active organisations deploying Prometheus Alertmanager to monitor their K8s infrastructure. We discovered some unusually common yet fatal mistakes made when choosing metrics, as well as some clever configurations drastically reducing noise.

We further studied and tested statistical concepts like Z-Score, Elliptic Envelope, Seasonality and their ability to detect and predict anomalies via time-series data at different scales, and will end with a kicker of a financial analysis of how much an average company could be losing to improper alerting.

This talk will give listeners a run-through of best practices and ‘what not to do' when choosing Prometheus metrics for noiseless and proactive alerting; preventing a few more folks from burning their fingers in their o11y journey.

<%= youtube_player("frgHo6WfhPw") %>