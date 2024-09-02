---
title: "Practical Anomaly detection at scale with PromQL"
---

## Practical Anomaly detection at scale with PromQL

At Grafana Labs, we built a scalable anomaly detection system to aid in debugging issues. For example, within a specified time range, did a particular service exhibit any anomalies in its USE metrics, RED metrics, or other key KPIs? This helps us narrow down the scope to a few “interesting” services when debugging errors in a complex system.

We started by building automatic baselines per service for common USE and RED metrics, and expanded it to easily include any counter or gauge that users can tag with a special label. The baselines and alerting are based on standard deviation but take seasonality into account for the past two weeks. This approach avoids noisy alerts during regular daily or weekly spikes. We have been running this system at scale and in production and are about to roll it out to customers.

In this talk, we will present why we chose to adopt anomaly detection and the framework (to be open-sourced at PromCon) we used to detect the anomalies purely using PromQL. We will demonstrate how the baselines can be visualized in Grafana and how we group these alerts for troubleshooting purposes (DO NOT PAGE ON ANOMALY ALERTS!).

Additionally, we will showcase the flexibility of the framework and how our users can add anomaly detection to their custom metrics by simply adding a single label: asserts_anomaly="gauge".

### Speakers
[Jorge Creixell](../../speakers/jorge-creixell)

<img src="https://sessionize.com/image/b0b6-400o400o1-BioT8o1sdtC7aQtX1xumrL.jpg" style="width: 100px; border-radius: 50%" alt="Jorge Creixell Profile Picture"/>

[Manoj Acharya](../../speakers/manoj-acharya)

<img src="https://sessionize.com/image/cfe9-400o400o1-L4zFadqAPZdbKAdJ4bvTS5.jpg" style="width: 100px; border-radius: 50%" alt="Manoj Acharya Profile Picture"/>

