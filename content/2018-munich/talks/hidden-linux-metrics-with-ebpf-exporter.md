---
title: Hidden Linux Metrics with ebpf\_exporter
---

## Hidden Linux Metrics with ebpf\_exporter

Speaker: [Ivan Babrou](/2018-munich/speakers/ivan-babrou/)

While there are plenty of readily available metrics for monitoring the Linux kernel, many gems remain hidden. With the help of recent developments in eBPF, it is now possible to run safe programs in the kernel to collect arbitrary information with little to no overhead. A few examples include:

* Disk latency and IO size histograms
* Run queue (scheduler) latency
* Page cache efficiency
* Directory cache efficiency
* LLC (aka L3 cache) efficiency
* Kernel timer counters
* System-wide TCP retransmits

Practically any event from "perf list" output and any kernel function can be traced, analyzed, and turned into a metric with almost arbitrary labels attached to it.

If you are already familiar with BCC tools, you may think of ebpf\_exporter as BCC tools turned into Prometheus metrics.

In this talk we'll go over eBPF basics, how to write programs and get insights into a running system.

https://github.com/cloudflare/ebpf\_exporter
