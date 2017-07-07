---
title: Staleness in Prometheus 2.0
---

## Staleness in Prometheus 2.0

Speaker: [Brian Brazil](/2017-munich/speakers/brian-brazil/)

The biggest semantic change in Prometheus 2.0 is the new staleness handling. This long awaited feature means there's no longer a fixed 5 minute staleness. Now time series go stale when they're no longer exposed, and targets that no longer exist don't hang around for a full 5 minutes. Learn about how it works and how to take advantage of it.
