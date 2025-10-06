---
title: "CPU Hardware Counters"
---

## CPU Hardware Counters

Counters are a fundamental unit of monitoring in Prometheus: how many requests were processed, how many CPU-seconds consumed, how many bytes sent over a network. These counters are exposed either by the application being monitored or by the operating system.

But there are also counters inside the CPU itself, such as number of cache hits, number of RAM accesses, number of instructions processed. These can give an amazingly detailed view of how the system is performing.

Historically it was impossible to get at CPU-level counters on cloud servers, as they were hidden by the hypervisor. But in the few years, CPU manufacturers and cloud providers have added interfaces to bridge this gap

This talk looks at:

 * What kinds of CPU counters are most useful.
 * When you can get access to CPU counters on cloud servers.
 * How to get those counters into Prometheus.

We will focus on the Linux operating system.


### Speakers
[Bryan Boreham](../../speakers/bryan-boreham)

<img src="https://sessionize.com/image/80de-400o400o1-3NEWQ8tkccc68Ws7anRFkJ.jpg" style="width: 100px; border-radius: 50%" alt="Bryan Boreham Profile Picture"/>

