---
title:  Practical Capacity Planning Using Prometheus
---

## Practical Capacity Planning Using Prometheus

Speaker: [Andrew Newdigate](/2019-munich/speakers/Andrew Newdigate/)

GitLab.com’s monolithic Rails application experiences high week-on-week traffic growth. To ensure availability, GitLab’s Infrastructure team track and plan ahead in order to avoid hitting capacity limits in the application, whether these limits be CPU, database connection pools, memory, storage or any number of other finite resources. Hitting these limits could result in hours, or days, of degraded service while workarounds are put in place.  With this in mind, the team set about building a set of tools on top of Prometheus recording rules and alerts to provide them with the information they need to be sufficiently forewarned, up to a month in advance, of potential resource saturation issues.  If you’ve ever felt that you’re reactively responding to resource saturation issues, this session will provide practical examples of how we’re building a framework for resource planning into our SRE team workflow. We’ll be presenting our open-source solution and explaining how it works for us.

[Slides](/2019-munich/slides/practical-capacity-planning-using-prometheus.pdf)
