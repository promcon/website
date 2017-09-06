---
title: The Uninstrumentable; Getting Apache Spark and Prometheus to Play Nicely
---

## The Uninstrumentable; Getting Apache Spark and Prometheus to Play Nicely

Speaker 1: [Dan Rathbone](/2017-munich/speakers/dan-rathbone/)

Speaker 2: [Joe Stringer](/2017-munich/speakers/joe-stringer/)

Instrumenting your code with Prometheus is simple and easy. Or so we thought until we tried to instrument our Python application running under Apache Spark… The distributed nature of Spark presents some interesting challenges when it comes to instrumenting your code effectively, for example a lack of global state, transient processes and no control over the execution profile.

We’ll talk about our myriad failed attempts at instrumenting under Spark and our journey to finally getting something working effectively, without DOSing Prometheus with millions of time series! :)

<%= youtube_player("KMk1aJaAkhw") %>

[Video link](https://youtu.be/KMk1aJaAkhw) -
[Slides](/2017-munich/slides/the-uninstrumentable-getting-apache-spark-and-prometheus-to-play-nicely.pdf)
