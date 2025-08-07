---
title: "Engage Prometheus in Rust Ecosystem"
---

## Engage Prometheus in Rust Ecosystem

Above 90% of Prometheus-related projects are in Go. For many years, other languages have only a client to expose Prometheus metrics, and nothing more.

But we want to make some changes. We've devoted years to building many useful yet fundamental basic Rust libraries that work with Prometheus, like a native PromQL parser or Prometheus Remote protocols, that have been used by hundreds of other projects with over 180k downloads.

And that's not the only aspect, we're also actively exploring the possibility to combine Prometheus with other widely used Rust projects in various ways, including arrow-rs, otlp-arrow, Parquet and DataFusion etc. Each of which can bring some new advantages in protocol, data storage, computation or more to the Prometheus economic system.

In this session I want to share our journey so far, the good, the bad and the sweet things when carving out Prometheus' way in Rust. We've learned so many lessons as well as sparked lots of inspiration. Looking forward to discovering a new world in hacking and using Prometheus with you.

### Speakers
[Ruihang Xia](../../speakers/ruihang-xia)

<img src="https://sessionize.com/image/8ff8-400o400o1-WbyVk7N9wYMMEuKVtQ1jsh.jpg" style="width: 100px; border-radius: 50%" alt="Ruihang Xia Profile Picture"/>

