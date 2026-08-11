---
title: "having the PromQL Yak: 6 PromQL Functions to Escape from Analytical Workarounds"
---

## having the PromQL Yak: 6 PromQL Functions to Escape from Analytical Workarounds

Prometheus is great at storing metrics and answering the questions we already know how to ask. We all love that.

But when we need deeper analysis — “are these signals related?”, “is this trend unusual?”, “how long until we hit a threshold?” — things get awkward. We end up with huge PromQL queries, recording rules, external tools, or staring at two dashboards hoping the answer jumps out.

This talk explores six experimental PromQL functions designed to bring more analytical capabilities into Prometheus itself: correlation_over_time & regression_over_time, ewma_over_time, zscore & robust_zscore, time_to_threshold, and timeseries_gen.

We’ll explore where they help, where they don’t, and why timeseries_gen might be the moment I need a tomato shield ;).

All of these were vibecoded behind --enable-feature=promql-experimental-functions. Whether this is a practical exploration or a subtle attempt to get these functions accepted upstream… you’ll decide.

### Speakers
[Juan Jose Ciarlante](../../speakers/juan-jose-ciarlante)

<img src="https://cdn.sessionize.com/image/db84-400o400o1-wWUWni65ih38svBSX5mFET.jpg" style="width: 100px; border-radius: 50%" alt="Juan Jose Ciarlante Profile Picture"/>

