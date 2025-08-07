---
title: "Alertmanager Has Amnesia – Should We Fix It?"
---

## Alertmanager Has Amnesia – Should We Fix It?

When Alertmanager is rebooted, it loses its understanding about the current "state of the world", i.e. which alerts are actively firing. This is by design, and is in principle no bad thing - Prometheus rules are typically evaluated by multiple replicas of ruler components every 60 seconds, meaning a constant flow of alerts are hitting Alertmanager. Under ideal conditions, this allows the system to quickly reconstruct the "state of the world".

However, in production, life is never quite so simple. Network calls are unreliable by nature, - packets go missing or (more likely) DNS hiccups occur, resulting in alerts not reaching their destination. In high volume environments, these intermitten failures can pile up, leading to a significant gaps in Alertmanager's perception of the alerting landscape.

The complexity increases significantly once we cluster Alertmanager instances for high availability. Each member of the cluster takes turns being the leader, responsible for deciding which notifications need to be shipped to downstream systems. This dynamic introduces numerous race conditions and edge cases, which can lead to unexpected or undesirable behaviour such as duplicate notifications, or missing resolved alerts.

Recently, engineers in our team took part in a hackathon where we played around with a simple idea: what if Alertmanager maintained a shared external view of its state of the world, that persisted across restarts? This is not a new idea - in fact etcd was proposed as a potential backend for such a shared store as far back as 2019.

With the increase in adoption of the Prometheus ecosystem since then, perhaps it is time to revisit and reconsider this approach. In this talk, we'll outline the details of what we hacked together, explore our motivations, and provide an update on progress we made since.

### Speakers
[Joel Verezhak](../../speakers/joel-verezhak)

<img src="https://sessionize.com/image/2098-400o400o1-HmvVmEuVNn2NyMzKMG8Vsh.jpg" style="width: 100px; border-radius: 50%" alt="Joel Verezhak Profile Picture"/>

