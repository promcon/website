---
title:  TSDB WTF
---

## TSDB WTF

Speaker: [Ian Billett](/2020-online/speakers/ian-billett/)

The TSDB is the beating heart of any instance of Prometheus; it is the storage engine that lets users efficiently store and query billions of data points. However, getting the best out of the TSDB is non-trivial and easy to get wrong. 

If we can develop an understanding of how it works under the hood, we can precisely reason about what it is well suited for, and more importantly, what it is not well suited for.

In this beginner-focused talk Ian will introduce the TSDB, examine its main components, and explain how each piece fits together. We will walk through the lifecycle of a sample, from storage to compaction and retrieval. In this journey we will cover: blocks, chunks, wals, series churn, cardinality, inverted indexes and… gorillas?
