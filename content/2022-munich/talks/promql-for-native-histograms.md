---
title: "PromQL for Native Histograms"
---

## PromQL for Native Histograms

Speaker(s): [Björn Rabenstein](../../speakers/björn-rabenstein)

So far, every sample value in a Prometheus time series has been a simple floating point value. The new Native Histograms (formerly known as Sparse Histograms) break with that tradition. The value of a Histogram sample is a fully fledged histogram, with a dynamic number of buckets and the usual count and sum of observations all included. Dealing with this kind of “structured” samples requires fundamental changes to PromQL. Beorn will show you how those changes look like and how to use them in practice to benefit from the power of Native Histograms. This includes aggregation of Histograms, accurate estimation of quantiles, displaying Histograms in text form or as heat maps, and more. Finally, the changes of PromQL required for Native Histograms also allow us to get a glimpse of a possible future PromQL with first class support of typed and structured samples.

<%= youtube_player("fikCqhlUOmQ") %>