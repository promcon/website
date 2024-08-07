---
title: "Inside a PromQL Query: Understanding the Mechanics"
---

## Inside a PromQL Query: Understanding the Mechanics

Speaker(s): [Bryan Boreham](../../speakers/bryan-boreham)

Ever wondered what happens under the hood when you execute a PromQL query? Join us for a deep dive into the internals of Prometheus as we trace the data flow from its origin to its final destination at the API.

In this session, we will explore:

* How selectors are looked up in the "postings" index,
* How samples are selected for instant and range queries,
* How functions take different types of input,
* The three different styles of aggregations,
* How operators join rows from different series,
* Final sorting and formatting into JSON

This talk aims to equip Prometheus users with a deeper understanding of query efficiency. We'll also highlight recent optimizations that have significantly improved query performance. Whether you're a seasoned user or just getting started, this session will provide valuable insights into making your PromQL queries more effective.
