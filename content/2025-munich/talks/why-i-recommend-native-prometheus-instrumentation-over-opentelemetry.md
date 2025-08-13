---
title: "Why I Recommend Native Prometheus Instrumentation over OpenTelemetry"
---

## Why I Recommend Native Prometheus Instrumentation over OpenTelemetry

With all the hype around OpenTelemetry, you may be tempted to use OpenTelemetry and its SDKs for all of your application instrumentation needs. However, when it comes to generating metrics for usage in Prometheus, you should at least think twice before going all in on OTel. Not only do you risk throwing away some of the core features that define Prometheus as a monitoring system, but you'll also end up with awkward metrics translation and escaping issues, as well as other inefficiencies and complexities. That's why I still recommend using Prometheus's own native instrumentation client libraries over the OTel SDKs if you want to get the best possible Prometheus monitoring experience. In this talk, I'm going to lay out some of the major reasons that led me to this opinion.

### Speakers
[Julius Volz](../../speakers/julius-volz)

<img src="https://sessionize.com/image/179f-400o400o1-94xVdPhRdCrP9bXN1dH1Y7.jpg" style="width: 100px; border-radius: 50%" alt="Julius Volz Profile Picture"/>

