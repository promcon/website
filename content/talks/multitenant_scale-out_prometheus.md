---
id: multitenant_scale-out_prometheus
title: Multitenant, Scale-Out Prometheus
kind: talk
---

## Multitenant, Scale-Out Prometheus

In this talk we'll present a prototype solution for multitenant, scale-out
Prometheus.

Our solution turns a lot of the Prometheus architectural assumptions on its
head, by marrying a scale-out PromQL query engine with a storage layer based
on DynamoDB. We have disaggregated the Prometheus binary into a
microservices-style architecture, with separate services for query, ingest,
alerting rules and storage. By designing all these services as fungible
replicas, this solution can be scaled out with ease and failure of any
individual replica can be dealt with gracefully.

This multitenant, scale-out Prometheus service forms a core component of the
Weave Service, a hosted management, monitoring and visualisation platform for
microservice & containerised applications. This platform is built from 100%
open source components, and we're working with the Prometheus community to
contribute all the changes we've made back to Prometheus.
