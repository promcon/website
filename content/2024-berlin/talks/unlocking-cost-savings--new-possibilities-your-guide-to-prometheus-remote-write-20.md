---
title: "Unlocking Cost Savings & New Possibilities: Your Guide to Prometheus Remote Write 2.0"
---

## Unlocking Cost Savings & New Possibilities: Your Guide to Prometheus Remote Write 2.0

Speaker(s): [Alex Greenbank](../../speakers/alex-greenbank) & [Bartłomiej Płotka](../../speakers/bartłomiej-płotka)

Prometheus Remote Write is the protocol used to send Prometheus metrics from Prometheus or any other metric source to compatible remote storage endpoints such as Thanos and Cortex. Remote Write is generally used for metric long term storage, centralization, and cloud services. It also enables users to run Prometheus in an agent mode, reducing local storage requirements.

Welcome to Remote Write 2.0! In this talk, Bartek and Alex, Prometheus maintainers and RW2.0 spec. co-authors, will introduce you to the next iteration of the popular protocol which adds more functionality while cutting your egress costs up to 60%, and keeps the previous versions easy-to-implement stateless design!

The audience will learn what's changed in the second version of Remote Write, what it unlocks, and how easy it is to update or adopt. Finally, the speakers will share the latest benchmarks and differences with the common alternatives.

There are many existing implementations of Remote Write Senders and Receivers; including CNCF projects like Prometheus itself, Cortex, Thanos, and OpenTelemetry Collector. A list is maintained on the Prometheus docs website.

Remote Write 2.0 is a step forward in the efficiency and supported use-cases of the protocol/spec, aggregating the newest features Prometheus ecosystem delivered since the Remote-Write 1.0.

Since Prometheus and common vendors will soon support Remote Write 2.0, as the protocol co-authors, we thought it would be a great idea to:

* Share what’s changed and why it’s important in the ecosystem to use and adopt.
* For o11y users to share what Remote Write 2.0 enables for them, especially if they use Prometheus as a sender.
* For o11y Dev+OSS+Vendor ecosystem share why and how to adopt it for both sending and receiving.
* Share how it compares with alternatives like OpenTelemetry OTLP (TL;DR: a bit of apples and oranges and there are use cases and trade-offs for both).
* What makes it so good with egress (and also compute) cost.

Hope, audience will enjoy this talk! (: 

