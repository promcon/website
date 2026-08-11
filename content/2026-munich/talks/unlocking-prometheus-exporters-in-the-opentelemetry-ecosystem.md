---
title: "Unlocking Prometheus Exporters in the OpenTelemetry Ecosystem"
---

## Unlocking Prometheus Exporters in the OpenTelemetry Ecosystem

Prometheus exporters have been the backbone of the ecosystem's success, providing essential metrics for years. While the OpenTelemetry community has begun duplicating some of this work, we’ve found an alternative path: leveraging the OpenTelemetry Collector Builder (OCB) to embed existing Prometheus exporters—like KSM, node-exporter, and cadvisor—directly into OTel Collector binaries. 

We’ll demonstrate how embedding these exporters eliminates sidecar overhead, simplifies pipelines, and allows the communities to share codebases rather than fragmenting efforts. Beyond the "how-to," we’ll address the technical challenge of mapping Prometheus-style metric naming to OTel semantic conventions. 

Attendees will gain a deep dive into the OCB build process, strategies for ensuring compatibility, and insights into how this evolution fosters long-term interoperability between the Prometheus and OTel ecosystems.

### Speakers
[Arthur Sens](../../speakers/arthur-sens)

<img src="https://cdn.sessionize.com/image/0a59-400o400o1-9bgMMK9ZRAAsY3mMb57iRK.jpg" style="width: 100px; border-radius: 50%" alt="Arthur Sens Profile Picture"/>

[Kyle Eckhart](../../speakers/kyle-eckhart)

<img src="https://cdn.sessionize.com/image/92ad-400o400o1-BabkMdoFw7LFjpau8FhpLc.jpg" style="width: 100px; border-radius: 50%" alt="Kyle Eckhart Profile Picture"/>

