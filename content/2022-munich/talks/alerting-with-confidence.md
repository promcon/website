---
title: "Alerting with Confidence"
---

## Alerting with Confidence

Speaker(s): [Xintao LAI](../../speakers/xintao-lai)

Alerts are hard to set and manage: when we set an alert, we would doubt ourselves, did I set the alert with the correct threshold? Will my alert fire correctly when something goes wrong? Which labels will my alert have? Who will receive the alerts? And when we received an alert, we will wonder, what does this alert mean? How bad is it?

I'd like to share our way of managing alerts. In Shopee, we use git to manage our alert rules (GitOps). Everyone can change or add an alert by submitting a Pull Request, and then we will review the changes as we do for code. However, it's still hard to review an alert if you are not familiar with the system's insights (the target you are monitoring), to solve that, our CI will replay the alert rules against the production metrics for the past 30 days, CI will report: how many times will the alert be triggered and which groups will be paged (using a tool config routes test). So everyone can get a picture of the changes. It's like a code coverage report (https://about.codecov.io/) for alerts.

To give more information to the receiver when an alert fires, the alert will be sent with a metrics chart that can tell what's going on. To do that, we will parse the alert rules into multiple expressions and render each expression (https://github.com/laixintao/promqlpy/). For example, an alert rule like "CPU > 0.8 or memory < 0.5", will render into 2 pictures that can tell you which of exactly CPU or memory triggered the alert. To make the on-call process more efficient.
