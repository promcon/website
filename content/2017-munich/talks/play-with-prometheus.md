---
title: Play with Prometheus - Journey to Make “testing in Production” More Reliable
---

## Play with Prometheus - Journey to Make “testing in Production” More Reliable

Speaker: [Giovanni Gargiulo](/2017-munich/speakers/giovanni-gargiulo/)

Gilt is a high end fashion e-commerce that in the recent years has moved from a monolithic architecture to 150+ distributed microservices running on AWS.

In Gilt we have to make sure our website runs smoothly and our customers are getting the best experience we can deliver. For this reason we have to keep an eye on our microservices and make sure they behave as expected.

We’ve been looking for a long time to way to keep long lasting time series, we could aggregate, query, visualize and use for alerting. After a lot of trial and error, we ended up finding the right pieces of the puzzle: Prometheus, Alertmanager, Push Gateway, and Grafana.

Our success story went viral in Gilt, and very recently Prometheus and Grafana have been added to the Gilt (and HBC!) techradar. A few teams have already lined up to adopt our Prometheus Stack in production and eventually we will implement a hierarchical Prometheus federation alongside meta-monitoring.

I would like to share with you our journey, what worked well, the problems we faced, and how we fixed them.

[Slides](https://docs.google.com/presentation/d/1Jw5RAnkE1vvg20wEc1Zb4cgp94poUm0Lt2LXS6D8kMM/edit#slide=id.p)
