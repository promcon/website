---
title: "Beyond TSDB: Unlocking Prometheus with Parquet for Modern Scale"
---

## Beyond TSDB: Unlocking Prometheus with Parquet for Modern Scale

Prometheus has been the main tool for time-series metrics in cloud-native world. Its TSDB format is used in many projects like Thanos, Cortex, and Mimir. But now, with OpenTelemetry’s need for an increased amount of time series dimensions, the well known limitations with high cardinality and slow queries from object storage are more pressing. In this talk, we want to share how we, from Grafana Labs (Mimir), AWS Managed Prometheus (Cortex), and Cloudflare (Thanos), tried to replace the Prometheus TSDB with Apache Parquet. Parquet is a columnar storage format that is already popular for big data analytics.

We will talk about what we learned from running Parquet storage in production. You will hear about the architecture, the problems we found, and the improvements we saw when we stored labels and chunks in Parquet. We hope you will see how Parquet can solve some old problems and help Prometheus go to the next level. We also want to invite you to help support Parquet in Prometheus directly.

All this work happened in the open, with conversations and code shared in CNCF Slack and on the Prometheus Community GitHub. We believe this open way is important, so everyone can join, give feedback, and help make Prometheus better for all.


### Speakers
[Jesus Vazquez](../../speakers/jesus-vazquez)

<img src="https://sessionize.com/image/bf5b-400o400o1-RF4Lh7w4ojhMqoVyraBU96.jpg" style="width: 100px; border-radius: 50%" alt="Jesus Vazquez Profile Picture"/>

[Alan Protasio](../../speakers/alan-protasio)

<img src="https://sessionize.com/image/7955-400o400o1-SHbWsm2cXsQJv29pSYQi29.jpg" style="width: 100px; border-radius: 50%" alt="Alan Protasio Profile Picture"/>

[Michael Hoffmann](../../speakers/michael-hoffmann)

<img src="https://sessionize.com/image/167e-400o400o1-9bfFDvbKBd736hHM3VC68V.jpg" style="width: 100px; border-radius: 50%" alt="Michael Hoffmann Profile Picture"/>

