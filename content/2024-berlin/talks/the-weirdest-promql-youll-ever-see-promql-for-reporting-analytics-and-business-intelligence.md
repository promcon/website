---
title: "The weirdest PromQL you’ll ever see: PromQL for Reporting, Analytics, and Business Intelligence"
---

## The weirdest PromQL you’ll ever see: PromQL for Reporting, Analytics, and Business Intelligence

Speaker(s): [Sam Jewell](../../speakers/sam-jewell)

Prometheus is fantastic at managing high frequency data. But what if you have an analytics use case? Sometimes we just want to lower the frequency; to see daily, weekly or monthly data and find long-term trends or growth rates.

We might want to consider any of these use cases per day, week or month, such as:
- Activity: requests or transactions
- Usage or consumption, for billing or auditing
- Count of events: alerts or incidents, for example.

Why use Prometheus rather than more traditional analytics tools for this? By querying Prometheus directly we can avoid creating/maintaining a data-pipelines, avoid data exports and staleness problems, and lean on the power of the Prometheus ecosystem: For example, we can create overviews for management, plan ahead, and alert on our reports.

Yet querying Prometheus by calendar-month in particular can be surprisingly tricky. PromQL doesn’t support using 1M in subqueries because month-lengths vary.

In this talk I’ll:
- Take you on a journey, to understand all the ways that the time dimension can be controlled when querying PromQL with:
  - The @ operator 
  - Subqueries
  - The offset keyword
- Navigate more PromQL gotchas along the way:
  - Why do we need rate and label_replace
  - How to control the MaxDataPoints when querying from Grafana
  - Use of Joins and the absent function
- Conclude by showing two different ways we can render monthly data FTW:
  - Render a saw-tooth cumulative counter which resets to zero every month-start
  - Use `and day_of_month()` in your query to get true monthly data from a counter

After this talk you will be able to query for daily, weekly or monthly data directly from Prometheus. As a result, you’ll be able to spot longer term trends or growth rates. And you’ll be able to compare with data from your other sources, for correlation or auditing purposes.

