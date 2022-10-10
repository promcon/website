---
title: "Fun with labels! What to do when metrics have different labels in PromQL"
---

## Fun with labels! What to do when metrics have different labels in PromQL

Speaker(s): [Jaime Yera Hidalgo](../../speakers/jaime-yera-hidalgo)

PromQL is great for combining and making math between different metrics. However, one of the most recurring nightmares of every engineer operating Prometheus is when two or more metrics in the same promQL expression don't share the same labels. 

PromQL offers different functions and ways to cover all the possible use cases for these kinds of situations. In this talk, Jaime will go through some of the most common scenarios, from the easiest to the more tricky ones, giving examples and showing the underling logic behind each solution.

In this talk, you will learn about:
How PromQL combines different metrics
PromQL functions for solving label conflicts
PromQL functions to modify labels at query time

