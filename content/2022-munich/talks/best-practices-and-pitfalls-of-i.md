---
title: "Best Practices and Pitfalls of Instrumenting Your Cloud-Native Application"
---

## Best Practices and Pitfalls of Instrumenting Your Cloud-Native Application

Speaker(s): [Jéssica Lins](../../speakers/jéssica-lins) & [Kemal Akkoyun](../../speakers/kemal-akkoyun)

Observability is the key to understanding how your application runs and behaves in action. Among many other observability signals like logs, traces and continuous profiling, metrics play the most substantial role. Sampled measurements observed throughout the system are crucial for ensuring service quality, improving performance, scalability, debuggability, security, and enabling real-time, actionable alerting. 

The act of building observable applications starts with instrumentation. Although the tools in the Prometheus ecosystem make life a lot easier, there are still numerous possibilities to make mistakes or misuse them.

During this talk, Jéssica and Kemal will present several useful patterns, best practices and idiomatic methods for instrumenting critical services. They will discuss common pitfalls, failure cases and instrumentation strategies while sharing useful insights and methods to avoid those mistakes. They will give tips for writing simple, maintainable and robust instrumentation facilities using several real-life examples. Moreover, they will demonstrate how to enrich metrics by correlating them with other observability signals. Last, they will discuss how to make the best usage of recent changes in the client_golang, a Go client library for Prometheus.

<%= youtube_player("B6Ds2myOIRc") %>