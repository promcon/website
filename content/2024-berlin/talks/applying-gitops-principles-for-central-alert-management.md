---
title: "Applying GitOps principles for central alert management"
---

## Applying GitOps principles for central alert management

Speaker(s): [Juraj Michálek](../../speakers/juraj-michálek) & [Pradeep Lalwani](../../speakers/pradeep-lalwani)

In this talk we will explore how we can use git to store and review  alerts for Prometheus and compatible backends such as Mimir, Thanos, Cortex.

Further we will use folder structure to control to which regions / environments and tenants the alerts and recording rules get deployed to.

We will also use Promtool, Promruval and pipeline tool of your choice to:

* Run unit tests for the alerts
* Validate the alerts queries (such as minimal range_interval in queries, syntax of the queries, querying only allowed tenants, etc)
* Ensure alerts follow company policies, i.e. have some specific labels present 
* Use either git-sync (https://github.com/kubernetes/git-sync) or argocd to deliver these alerts to your backend of choice.

At the end we will take a look at how we can use the same pattern for provisioning dashboards in Grafana.
