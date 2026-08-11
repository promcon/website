---
title: "Does anyone still need Prometheus Agent mode?"
---

## Does anyone still need Prometheus Agent mode?

I took over as Prometheus Agent mode maintainer knowing there wasn't much of a backlog waiting for me. The mode has been quiet since its 2021 launch. The two things people asked for, dropping the WAL and cutting memory overhead, have gone unanswered since 2022. Most of the work since has been bug fixes, docs, and remote-write compliance.

So what happened, and what do we actually need from a Prometheus agent today? Has agent mode become a thin shell that people skip in favor of the OpenTelemetry Collector or the full server, or is there still a reason to reach for it? I'll share my ideas on where I think agent mode could go, but I don't want to sketch a roadmap in a vacuum. If you run agent mode today, I want to hear why you picked it and what's missing. If you don't, help me work out what would make you confident enough to.

### Speakers
[Kyle Eckhart](../../speakers/kyle-eckhart)

<img src="https://cdn.sessionize.com/image/92ad-400o400o1-BabkMdoFw7LFjpau8FhpLc.jpg" style="width: 100px; border-radius: 50%" alt="Kyle Eckhart Profile Picture"/>

