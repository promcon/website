---
title: "Auto-generated coherent Observability"
---

## Auto-generated coherent Observability

How many times have you broken your observability because of a typo? Have you changed a metric or label name, and a super old (but essential!) alert just ~silently~ stopped working, and it took ages for you to realize? A dashboard suddenly stopped showing data, and you are unsure if a target is not being scraped or if the metric doesn't exist? Or even worse, have you changed a metric or label name in your instrumentation, and your applications suddenly started PANICKING!?!? 😱If you're working with Prometheus for a while, those are all problems you have faced before. 

One of the reasons Prometheus became successful was how easy it was to create new metrics and exporters. Organic growth was a blessing in the past, but it's now the reason why our observability story is so brittle. Everything needs to be updated carefully, and most often, it is a manual and error-prone operation. It's time to change; we can do better than that.

Please meet Weaver, a code generator! 

While Weaver's original goal was to facilitate the adoption of OpenTelemetry Semantic Conventions through SDKs in several languages, people are starting to realize how much more this tool can enable! 

In this talk, the audience will understand how Weaver can add cohesion to your whole Observability story. It doesn't matter if you're using Prometheus or OpenTelemetry SDKs, if you are using Prometheus or OTel-Collector to collect your metrics, and it doesn't matter if you're using Grafana or Perses as your dashboarding tool. Weaver doesn't care, and neither should you!


### Speakers
[Arthur Sens](../../speakers/arthur-sens)

<img src="https://sessionize.com/image/0a59-400o400o1-9bgMMK9ZRAAsY3mMb57iRK.jpg" style="width: 100px; border-radius: 50%" alt="Arthur Sens Profile Picture"/>

[Dominik Süß](../../speakers/dominik-süß)

<img src="https://sessionize.com/image/0aa3-400o400o1-c7ceedf8-3568-4c09-9282-76df2bcc7fda.jpg" style="width: 100px; border-radius: 50%" alt="Dominik Süß Profile Picture"/>

