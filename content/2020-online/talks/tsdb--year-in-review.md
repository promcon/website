---
title:  "TSDB: Year In Review"
---

## TSDB: Year In Review

Speaker: [Ganesh Vernekar](/2020-online/speakers/ganesh-vernekar/)

Prometheus’ storage engine has seen a lot of improvements and optimizations in the past 1 year since we had PromCon 2019 where I gave a review on TSDB developments since Prometheus 2.0. Similarly, in this talk, I will speak about all the new enhancements and features that have been added to TSDB since PromCon 2019 and will be added in the future. Some of the notable ones include:

1. Various memory optimizations for loading blocks and compaction.
2. Isolation
3. M-map of Head chunks.
4. Faster restarts with a snapshot of chunks.
5. Lifting the block index size limit.

I will also talk about how each of these developments impacted Prometheus.
