---
title: "Perses: The CNCF candidate for observability visualisation"
---

## Perses: The CNCF candidate for observability visualisation

Speaker(s): [Augustin Husson](../../speakers/augustin-husson) & [Antoine Thebaud](../../speakers/antoine-thebaud)

Perses is a new visualization tool supporting Prometheus, owned by the Linux foundation under the open source license Apache V2.

1. It aims to become a standard dashboard visualization tool for Prometheus and other datasources. It will focus on being GitOps-compatible and thus enabling a smooth ""dashboards as code"" workflow via a new and well-defined dashboard definition model.
2. While being another visualization tool, Perses also aims to provide different npm packages, so it can benefit anyone that would like to embed charts and dashboards in their UI. For example, these packages might be used to improve the display of the data in the Prometheus UI.
3. To be friendly to dashboards as code users, we want to provide a complete static validation of the dashboard format. That means you will be able to validate your dashboards in a CI/CD using the Perses CLI.

For the PromCon, we are proud to announce we are reaching a first public alpha version with all primary features we wanted to propose:

- Basic chart types available (timeseries, gauge, stat).
- Shared variables across dashboards.
- Scoped datasources (a datasource can be defined either at project or at global level).
- Plugin system at different levels (panel, query, datasource, variable).
- Dashboards as code with Cuelang and a data model that follows Kubernetes practices.

Any feedback will be greatly appreciated to be sure we didn’t miss anything around the architecture.
In a later stage, we will propose:

- a Kubernetes-native mode in which dashboard definitions can be deployed into and read from individual application namespaces (Using CRDs).
- Authentication & Authorization support.
- Visualization for logs and traces.
- Datasources discovery.
- Sub folder management.
- Panels generation.
