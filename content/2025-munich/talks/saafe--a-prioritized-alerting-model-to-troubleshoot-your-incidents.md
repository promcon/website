---
title: "SAAFE - A prioritized alerting model to troubleshoot your incidents"
---

## SAAFE - A prioritized alerting model to troubleshoot your incidents

Existing taxonomies for time-series data, including the Four Golden Signals, the RED, and the USE Method, are most concerned with the nature of each type of series. The SAAFE - Saturation, Amend, Anomaly, Failure, and Error alerting model helps you focus on what they imply and not the type. 

At Grafana Labs, we have built a scalable, fully automated alerting system that analyzes the data using its domain knowledge. These alerts are categorized into the SAAFE model based on their implications for the system. Combined with severity levels - info, warning, critical, no of instances, and `firing` duration, the SAAFE alerts are scored and ranked. When our on-call engineers troubleshoot incidents, they use the SAAFE categorization and ranking to prioritize, filter, and infer causality.  

In this talk, we will introduce the SAAFE method with real-world examples of how this has been useful. We will also share the open-source framework built purely using PromQL and Grafana that you can adopt.      

Benefits to the ecosystem 
Alert fatigue is a hot topic in the observability community. Symptom-based alerting methodologies like SLOs are effective in tracking availability. However, causal alerts, albeit noisy, are essential in identifying the root cause. In this talk, we will demonstrate how we can find the key signals from our alerts using just PromQL and Grafana. 

Additional resources 
This talk extends the framework we originally shared at Promcon 2024 - “Practical Anomaly Detection at scale with PromQL” 

PromCon 2024 - Practical Anomaly Detection at Scale With PromQL
https://github.com/grafana/promql-anomaly-detection

### Speakers
[Jorge Creixell](../../speakers/jorge-creixell)

<img src="https://sessionize.com/image/b0b6-400o400o1-BioT8o1sdtC7aQtX1xumrL.jpg" style="width: 100px; border-radius: 50%" alt="Jorge Creixell Profile Picture"/>

[Manoj Acharya](../../speakers/manoj-acharya)

<img src="https://sessionize.com/image/498b-400o400o1-7mna8GxAAKWZtWS5Uc8sBw.jpg" style="width: 100px; border-radius: 50%" alt="Manoj Acharya Profile Picture"/>

