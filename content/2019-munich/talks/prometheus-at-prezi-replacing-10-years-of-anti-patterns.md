---
title: "Prometheus at Prezi: Replacing 10 Years of Anti-patterns"
---

## Prometheus at Prezi: Replacing 10 Years of Anti-patterns

Speaker: [David Guerrero](/2019-munich/speakers/david-guerrero/)

This talk goes over how our micro-services infrastructure is set up at Prezi, how it used to be monitored with convoluted and unreliable solutions, how we introduced Prometheus to all of our services, what we learned, where we failed, how it improved our engineers' life and what it enables us to do now.  We recently spent 8 months redesigning our entire monitoring infrastructure, replacing 10 years of unreliable organically grown solutions to a uniform and highly available Prometheus-based platform. Our services being mostly written in Django/Python, we spent a lot of time getting in right and contributed back to the community (see https://engineering.prezi.com/prometheus-unchained-331b7ab8737, https://github.com/prezi/django-exporter).  This was also the opportunity to revise our alerting philosophy (using the famous "My Philosophy on Alerting") and had to re-educate all of our engineers on how to alert and how to make great dashboards (or not making any and just using generic alerts and dashboards). A key point was to measure the impact of these changes by counting the alerts and how engineer react to them (was the alert actionable?). Based on that, we can see how well our practices are performing and react if necessary.

<%= youtube_player("2vnvmE3-HMM") %>

[Video link](https://youtu.be/2vnvmE3-HMM) -
[Slides](/2019-munich/slides/prometheus-at-prezi-replacing-10-years-of-anti-patterns.pdf)
