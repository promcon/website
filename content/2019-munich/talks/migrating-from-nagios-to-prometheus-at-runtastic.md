---
title:  Migrating from Nagios to Prometheus at Runtastic
---

## Migrating from Nagios to Prometheus at Runtastic

Speaker: [Niko Dominkowitsch](/2019-munich/speakers/Niko Dominkowitsch/)

Thinking of replacing your existing monitoring solution with Prometheus? In this talk we will show you how Runtastic moved its monitoring and alerting stack from Nagios to Prometheus. We'll show you how we managed to do this, how monitoring and alerting works with Prometheus and what challenges we were facing.  

We will cover these topics: 

* How our journey started 
* Using Consul for Service Discovery 
* Using Terraform for managing health checks and silences for new micro services
* Building a pipeline to test and deploy alerting and recording rules automatically
* Using OpsGenie for Alert management
* Examples of common checks in Nagios and how we implemented them with Prometheus
* Examples of custom written Exporters
* Lessons Learned

[Slides](/2019-munich/slides/migrating-from-nagios-to-prometheus-at-runtastic.pdf)
