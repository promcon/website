---
title:  Expectations on Remote Data
---

## Expectations on Remote Data

Speaker: [Alfred Landrum](/2019-munich/speakers/Alfred Landrum/)

Prometheus's remote storage API allows PromQL evaluation to work with stores other than TSDB, and with data that may not have originated via native Prometheus scraping. PromQL has expectations about the data served by the API, which must be met in order to give a "compatible" user experience with native Prometheus.  I'll present my teams experience marrying an existing distributed time series database, originally designed around storing downsampled statsd-style metrics, with a PromQL evaluation engine. I'll cover topics including: downsampling, counter aggregation, series staleness, and others. 
