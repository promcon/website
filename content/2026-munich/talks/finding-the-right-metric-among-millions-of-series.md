---
title: "Finding the Right Metric Among Millions of Series"
---

## Finding the Right Metric Among Millions of Series

Before querying Prometheus, you must first discover what exists: the right metric, label, or value. Today, discovery relies on APIs that return metadata without relevance ranking, leaving clients to download, filter, and rank the results. As cardinality and tenant size grow, that approach produces large responses and slow or incomplete autocomplete.

The new Prometheus search API moves discovery to the server. It uses three endpoints to search and rank metric names, label names, and label values by relevance. Results are streamed as NDJSON, so typing a fragment like "http req" immediately returns relevant matches without a full download of all matches.
We will trace this API from Prometheus through Grafana Mimir to Grafana’s query editors. We’ll explore the design choices, like subsequence matching and Jaro-Winkler algorithm, that enable fast, distributed discovery at scale.

In this talk we'll

Learn why client-side filtering fails at high cardinality.
Explore the new endpoints and controls like `search[]`, `sort_by=score` and `fuzz_alg`.
Understand how relevance ranking turns typed fragments into accurate matches.
See how NDJSON streaming and batching improve performance.
Follow the implementation across the full Prometheus and Grafana stack.

After this talk you'll be able to

Use the search API to discover metrics, labels, and values by relevance, and build responsive discovery tools without downloading entire metadata sets.


### Speakers
[Ismail Simsek](../../speakers/ismail-simsek)

<img src="https://cdn.sessionize.com/image/7dc5-400o400o1-aq3KCKhLEtg3zkHNoFc4Dg.jpg" style="width: 100px; border-radius: 50%" alt="Ismail Simsek Profile Picture"/>

[Arve Knudsen](../../speakers/arve-knudsen)

<img src="https://cdn.sessionize.com/image/eda9-400o400o1-fFNkViNmjhiRjXSV5PyZuG.jpg" style="width: 100px; border-radius: 50%" alt="Arve Knudsen Profile Picture"/>

