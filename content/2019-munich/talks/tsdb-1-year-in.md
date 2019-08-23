---
title: "TSDB: 1 Year In"
---

## TSDB: 1 Year In

Speaker: [Ganesh Vernekar](/2019-munich/speakers/Ganesh Vernekar/)

Since a major revamp of the Prometheus storage engine as part of the Prometheus 2.0 release, there have been a lot of enhancements and feature additions in TSDB.

In this talk I will speak about all that has gone into TSDB since 2.0 was released, some of the notable ones include:

* Backfilling
* Disk size based retention
* WAL compression and read optimizations
* Postings compression and lifting the 64 GiB index size limit to be practically unlimited
* Allocation and memory optimization for compaction
* Various optimization for the queries
* Read Only mode
* Isolation

I will also talk about how each of these developments impacted Prometheus and how devs embedding them in their own apps can leverage them.
