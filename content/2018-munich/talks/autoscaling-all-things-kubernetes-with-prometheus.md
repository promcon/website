---
title: Autoscaling All Things Kubernetes with Prometheus
---

## Autoscaling All Things Kubernetes with Prometheus

Speakers:
* [Michael Hausenblas](/2018-munich/speakers/michael-hausenblas/)
* [Frederic Branczyk](/2018-munich/speakers/frederic-branczyk/)

Autoscaling in Kubernetes used to be an inconsistent concept, however using the new metrics APIs defined by Kubernetes SIG Instrumentation the monitoring system of choice can be used. As it turns out, Prometheus is a popular system being used alongside Kubernetes, and the community has already developed a custom-metrics-api adapter to be used for Prometheus. This means, we can now perform autoscaling on the cluster and application level with metrics collected by Prometheus.

While for some use cases single values are enough, for others more sophisticated historic metrics are necessary. In the context of the SIG Autoscaling, we're working on a Vertical Pod Autoscaler (VPA), allowing for vertical autoscaling of pods (that is, adapting resource limits and requests) based on metrics from Prometheus (see https://github.com/kubernetes/community/blob/master/contributors/design-proposals/autoscaling/vertical-pod-autoscaler.md).

Frederic and Michael will review the history of metrics in Kubernetes, discuss the current state of metrics and autoscaling on Kubernetes using Prometheus with a focus on VPAs as well as show it in action.
