---
title: "RSS Lied to Me: A Field Guide to Linux Memory Metrics"
---

## RSS Lied to Me: A Field Guide to Linux Memory Metrics

It’s 3am. A key process has just been killed. “Out Of Memory” - which metric do you look at?

Welcome to the wonderful world of Linux memory metrics, where there are at least 20 different numbers that might tell you how much memory something is using. Working Set, Resident Set, PSS, VSZ - they’re all different, maybe by orders of magnitude, and none of them add up to how much RAM is in the box.

Sometimes the working set goes down when things get tight. Sometimes it goes up even though you didn’t use any more memory.

This talk is a short and sweet explainer, which I wish I’d had when I first started. We’ll cover:
* What the key metrics tell you.
* Which conditions you should alert on.
* The punchline: no one metric will tell you everything you need to know.

You’ll leave equipped to face the next 3am page, or maybe even prevent it.

### Speakers
[Bryan Boreham](../../speakers/bryan-boreham)

<img src="https://cdn.sessionize.com/image/80de-400o400o1-3NEWQ8tkccc68Ws7anRFkJ.jpg" style="width: 100px; border-radius: 50%" alt="Bryan Boreham Profile Picture"/>

