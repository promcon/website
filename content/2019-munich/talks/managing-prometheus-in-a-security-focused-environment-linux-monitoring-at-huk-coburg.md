---
title:  Managing Prometheus in a Security-focused Environment -- Linux Monitoring at HUK-COBURG
---

## Managing Prometheus in a Security-focused Environment -- Linux Monitoring at HUK-COBURG

Speaker: [Christian Hoffmann](/2019-munich/speakers/christian-hoffmann/)

Prometheus offers lots of features and flexibility which often leaves newcomers with lots of open questions: Which service discovery to use? How to secure access to metrics? Which architecture to implement?  In order to provide some input back to the community, this talk will outline how we run Prometheus at HUK-COBURG in order to provide a multi-tenant turn-key monitoring experience in a security-focused environment. It covers basic decisions like scrape intervals and service discovery and extends to the implementation of encrypted and authenticated connections to monitoring targets using sshified and team-aware access to Prometheus/Grafana access via prometheus-filter-proxy.
