---
title: "Testing Kubernetes apps' observability end-to-end"
---

## Testing Kubernetes apps' observability end-to-end

Speaker(s): [João Pedro Machado Vilaça](../../speakers/joao-pedro-machado-vilaca)

This presentation is designed for developers and DevOps engineers with a basic understanding of Kubernetes, Prometheus, and alerting concepts. We will cover how to end-to-end test observability features in Kubernetes applications using Prometheus, AlertManager, and various testing frameworks and libraries. We will demo how to set up a test environment, spin up a disposable local cluster, and use Prometheus client libraries for testing. Then, we will see how to write tests for Metrics and Events to ensure their availability and correctness, which are essential to monitoring the application's behavior and diagnosing issues. Next, we will focus on Alert testing. Our primary goal is to understand how to test Alerts for accuracy and timeliness, as alerting is one of the critical components of observability. We will discuss how to ensure our alerts are actionable, relevant, and real, and show how to configure them correctly and ensure they react to the appropriate triggering conditions.

<%= youtube_player("kDMdGLkRrF8") %>