---
title:  Managing Grafana dashboards with grafonnet and git
---

## Managing Grafana dashboards with grafonnet and git

Speaker: [Adam Wolfe Gordon](/2019-munich/speakers/Adam Wolfe Gordon/)

Grafana is a wonderful tool for visualizing Prometheus data. Getting started with Grafana is simple: login, create a dashboard, add some graphs, and call it a day. Come back later, add some graphs, edit some graphs, hit save and it's all live!  Flash forward a few months or years and your Grafana instance probably has tens or hundreds of dashboards. Many of them present similar data in slightly inconsistent ways. You can see who last edited a dashboard and why, but it's hard to visualize the changes they made. There's no good way to review changes before they go live like you would for any other code you write. One row on your favorite dashboard is ever so slightly taller than the others and it makes you twitch every time you notice.  At DigitalOcean we've solved these problems by storing our dashboard definitions in git, making them human-readable with grafonnet, and updating them via continuous integration. In this talk we'll describe our setup, show how it enables component re-use between dashboards, and demonstrate how it improves the ergonomics of managing Grafana dashboards at scale.
