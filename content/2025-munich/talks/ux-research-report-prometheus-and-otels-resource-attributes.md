---
title: "UX Research Report: Prometheus and OTel's Resource Attributes."
---

## UX Research Report: Prometheus and OTel's Resource Attributes.

There are currently three strategies for handling OTel resource attributes in Prometheus:
 
1. Map all attributes into labels, which leads to high cardinality problems.
2. Encode all attributes to the `target_info` metric and use PromQL Joins, which have a high entry barrier for Prometheus users.
3. Select which attributes become labels with the `promote_resource_attributes` configuration option, which is not friendly to changes in that list.

Is this really all there is for resource attributes? Has Prometheus nailed their user story in this topic?

Through CNCF's LFX mentorship program, Victoria and Andrej conducted UX Research to understand how Prometheus should handle OTel's resource attributes. Using quantitative and qualitative approaches, they collected opinions from co-founders of both projects, active and old maintainers, and end-users.

By joining this talk, the audience will learn more about what is going well and what could be improved, while listening to Victoria and Andrej share educated suggestions for the project maintainers.


### Speakers
[Victoria Nduka](../../speakers/victoria-nduka)

<img src="https://sessionize.com/image/59ad-400o400o1-KPLfcUzFdkasJ5MyPf7wpm.jpg" style="width: 100px; border-radius: 50%" alt="Victoria Nduka Profile Picture"/>

[Andrej Kiripolský](../../speakers/andrej-kiripolský)

<img src="https://sessionize.com/image/9d4c-400o400o1-9K6AntmS2QRbAHmx3EDmJ1.jpg" style="width: 100px; border-radius: 50%" alt="Andrej Kiripolský Profile Picture"/>

