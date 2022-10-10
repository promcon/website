---
title: "Securing Prometheus: lessons learned from OpenShift"
---

## Securing Prometheus: lessons learned from OpenShift

Speaker(s): [Manuel Hernandez Valero](../../speakers/manuel-hernandez-valero) & [Jesus Angel Samitier](../../speakers/jesus-angel-samitier)

Nowadays, security is one of the most important things in an enterprise environment, and companies are investing a lot in secure software.

When you deploy Prometheus in a Kubernetes cluster, there isn’t any built-in security feature, neither in Kubernetes nor in the Prometheus deployment.

On the other hand, when you deploy an OpenShift cluster, you get a Prometheus monitoring stack fully secured with ServiceAccounts, RoleBindings, TLS, tokens, etc. The question is, how does OpenShift integrate all these security features into Prometheus?

In this talk, Manuel and Jesus will go through all the security features that OpenShift implements, making Prometheus more secure. This way, the assistants will learn by example a toolbox of security best practices for Prometheus deployments in Kubernetes.
