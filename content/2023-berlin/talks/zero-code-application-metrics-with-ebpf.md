---
title: "Zero-code application metrics with eBPF and Prometheus"
---

## Zero-code application metrics with eBPF and Prometheus

Speaker(s): [Nikola Grcevski](../../speakers/nikola-grcevski) & [Mario Macias](../../speakers/mario-macias)

Instrumenting an existing application can require some toil, such as integrating instrumentation libraries, making changes to your code, as well as rebuilding and redeploying your packages. In order to soften your observability adoption, Grafana built the eBPF autoinstrument tool [Beyla](https://github.com/grafana/beyla), which provides RED (Rate, Errors, Duration) metrics through Prometheus for your existing web services, whichever language they are written in.
The eBPF tool is non-intrusiautoinstrumentve, i.e you don’t need to change any line of application code or configuration; you only need to deploy the auto-instrument tool in the same host as the service that you want to monitor. Collecting monitoring data with the eBPF autoinstrument tool has very low overhead, and allows you to capture data about your runtime which is impossible with manual code instrumentation.
