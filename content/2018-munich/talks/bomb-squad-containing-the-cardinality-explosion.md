---
title: "Bomb Squad: Containing the Cardinality Explosion"
---

## Bomb Squad: Containing the Cardinality Explosion

Speaker: [Cody Boggs](/2018-munich/speakers/cody-boggs/)

Series cardinality can be a large foot-gun that can take out a Prometheus instance quickly. It can have similar impacts to downstream systems when using remote write. Finding the offending series and recovering from such an event can cause a large downtime for your Prometheus installation. In this talk I will show an implementation of a sidecar to Prometheus that automatically detects and squelches series whose cardinality is growing quickly. Using a combination of recording rules, dynamic metric relabel configs, and alerting, we can detect, throttle, and alert on any explosion in progress.
