---
title: Hadoop, Fluentd Cluster Monitoring with Prometheus and Grafana
---

## Hadoop, Fluentd Cluster Monitoring with Prometheus and Grafana

Speaker: [Wataru Yukawa](/2016-berlin/speakers/wataru-yukawa/)

At LINE, we are creating and maintaining a log analysis platform on top of
Hadoop, Hive, and Fluentd. We were unsatisfied with existing monitoring
systems like Ganglia and Nagios and recently started using Prometheus and
Grafana. We especially liked Prometheus's powerful query language, unified
monitoring and alerting, as well as the pull-based architecture. We created
Prometheus exporters for Hadoop and jstat and fluentd, and are also using Node
Exporter to monitor machine-level metrics. For access and application log
metrics, we use fluent-plugin-prometheus. This talk presents our use case.

<%= youtube_player "dzmzvmul7PU" %>
<%= slideshare_player "3v2wpHNu1g873R" %>
