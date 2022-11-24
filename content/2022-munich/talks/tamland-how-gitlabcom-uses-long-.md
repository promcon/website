---
title: "Tamland: How GitLab.Com Uses Long-Term Monitoring Data For Capacity Forecasting"
---

## Tamland: How GitLab.Com Uses Long-Term Monitoring Data For Capacity Forecasting

Speaker(s): [Andrew Newdigate](../../speakers/andrew-newdigate)

Tamland is a capacity planning tool built by GitLab to provide long-term forecasts of potential capacity issues across the services running GitLab.com. It's built on top of the long-term metric storage capabilities of Thanos, which provides utilization and saturation metric data stretching back over a 1 year period. From this, a predictive forecast model is constructed and used to predict future growth trends across hundreds of saturation points over the coming months. This practical talk demonstrates how we capture long-term metrics data in a scalable way using Thanos, how we use Facebook's Prophet library for building forecast models, and how we integrate this with Jupyter to generate a report complete with visualizations. It discusses the benefits of switching to a data-driven and repeatable approach to capacity planning, as well as some of the practical challenges of building the tool. Tamland is an open-source project and attendees have access to the project source if they're interested in digging deeper into our implementation.

<%= youtube_player("2R42jW98MXg") %>