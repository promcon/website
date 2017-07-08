---
title: A Worked Example of Monitoring a Queue Based Application
---

## A Worked Example of Monitoring a Queue Based Application

Speaker: [Laurie Clark-Michalek](/2017-munich/speakers/laurie-clark-michalek/)

There has been a lot of work around educating people about how to instrument their applications, and how to set up your Prometheus installation to do tons of interesting things. This talk aims to address questions around which metrics provide the most value, and why. We will go through an example of instrumenting a service in production at Qubit, and explain the rationale behind the metrics we use for alerting and dashboarding. The aim is to give viewers a concrete example of how to monitor something, and highlight the logic behind the decisions made, be they specific to this service, or generalisable to almost anything.

Viewers should come away with the ability to implement meaningful instrumentation on their services, and a basic understanding around the answer to the questions ‘what makes a good metric’, ‘what makes a good dashboard’ and ‘what makes a good alert’. My aim is that the services that viewers write will wake people up needlessly less often, and when they wake people up, the service’s dashboards will be a boon to the responder, and not a false friend.
