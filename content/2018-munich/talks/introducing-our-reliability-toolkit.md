---
title: "Improving Reliability Through Engineering an Easy-to-use Prometheus-Based Monitoring and Alerting Stack: Introducing Our Reliability Toolkit"
---

## Improving Reliability Through Engineering an Easy-to-use Prometheus-Based Monitoring and Alerting Stack: Introducing Our Reliability Toolkit

Speakers:

* [Robin van Zijll](/2018-munich/speakers/robin-van-zijll/)
* [Janna Brummel](/2018-munich/speakers/janna-brummel/)

By definition, SREs are responsible for the reliability of sites, but what if they don’t own any sites themselves? Within ING, the largest bank of the Netherlands, BizDevOps teams are autonomous and responsible for the build and run of their services. In theory, that could make the existence of SRE obsolete, right? How can you improve availability for end customers in an environment of engineers with full service ownership? How to convince without the power of intervention? How to improve without being blameful?

We’ll explain how we, a team of 8 SREs among 1700 DevOps engineers, try to improve stability by focussing on software engineering. We created the Reliability Toolkit to help BizDevOps teams with their reliability challenges in the fields of white box monitoring and alerting while minimizing toil.

This talk will explain:

- Our SRE team purpose and why we think our approach with heavy focus on software engineering works for our organization;
- The concept of the Reliability Toolkit and introduction of its components and their set up (Prometheus, Alertmanager, Grafana, NGINX Log Aggregator, SMS and ChatOps functionalities)
- How we provision Reliability Toolkit
- How we convince, onboard and educate BizDevOps teams to use the Reliability Toolkit

During this talk we will demo:

- A Kafka to Prometheus consumer (and why we this is not what we want)
- Prometheus Model Builder, generate expectation models out of any Prometheus metric
- A collection of templated Grafana dashboards to give every team a kickstart
