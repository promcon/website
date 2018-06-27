---
title: Implementing a Cooperative Multi-Tenant Capable Prometheus
---

## Implementing a Cooperative Multi-Tenant Capable Prometheus

Speaker: [Jonas Große Sundrup](/2018-munich/speakers/jonas-grosse-sundrup/)

Prometheus is capable of and used for monitoring large infrastructures, from corporate networks to world-spanning CDNs. But while performing excellent on setups of large scales, it is also extremely well suited for small setups due to its simplicity and modularity both in operation as well in usage.

To further simplify leveraging the power of Prometheus for monitoning, we developed a cooperative, centrally managed multi-tenant-capable Prometheus system that minimizes the entry barrier for participants, introducing Prometheus to small-scale monitoring including out-of-the-box capabilities for blackbox montioring.

The multi-tenancy layer in this case serves two distinct purposes: First, it ensures that every user can only access their own metrics when querying. Second, it ensures that every user can only create alerts or alert silences for their own set of metrics.

In the process of doing so, we will investigate how the Prometheus frontend handles queries and how alerts and silences are submitted and modified accordingly, to implement multi-tenancy in Prometheus.

The entire setup is usable with out-of-the-box standard Prometheus components, no patches necessary.
