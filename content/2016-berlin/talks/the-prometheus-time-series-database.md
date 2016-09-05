---
title: The Prometheus Time Series Database
kind: talk
---

## The Prometheus Time Series Database

Various time series databases (TSDBs) have been implemented on top of
key-value stores with BigTable semantics. The TSDB that sits at the core of
the Prometheus monitoring system started with a similar approach and was built
on top of LevelDB. The Prometheus server as we know it today, however, uses a
highly optimized custom storage layer for bulk sample data, enabling a single
server to sustain an ingestion rate of 500,000 samples per second belonging to
millions of time series. Very recent improvements of the in-memory
representation of sample data resulted in an outstanding compression level of
1.3 bytes per sample in a typical production setup. A journey from fundamental
challenges of TSDB design to details of the Prometheus storage layer.

<%= youtube_player "HbnGSNEjhUc" %>
<%= google_slides_player "1TMvzwdaS8Vw9MtscI9ehDyiMngII8iB_Z5D4QW4U4ho" %>
