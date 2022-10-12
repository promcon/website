---
title: "Monitoring In-Store Point of Sales Infrastructure with Prometheus and Netbox"
---

## Monitoring In-Store Point of Sales Infrastructure with Prometheus and Netbox

Speaker(s): [Felix Peters](../../speakers/felix-peters)

Monitoring bare metal infrastructure with Prometheus is hard because there is no easy way for service discovery. We had the challenge of monitoring our new point of sales infrastructure in stores which contains cash desk hardware, printers and card payment terminals. These devices should be auto discoverable without the pain of static service discovery. Prometheus was already the monitoring solution we love and have experience with. 

This talk is about how we solved this challenge by using Netbox as an inventory management system, integrated with Prometheus using the new http service discovery method. We will discuss several solutions, strategies, pitfalls and how this could be scaled to any kind of classic infrastructure.
It's also about how this increased the quality of our infrastructure documentation, just because engineers get a real benefit of writing down what's deployed while getting monitoring just out of the box. 
