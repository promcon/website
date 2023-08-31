---
title: "Metrics Explorer: A tool used to learn about Prometheus, gain insight into metrics and search metrics dynamically"
---

## Metrics Explorer: A tool used to learn about Prometheus, gain insight into metrics and search metrics dynamically

Speaker(s): [Brendan O'Handley](../../speakers/brendan-o-handley) & [Catherine Gui](../../speakers/catherine-gui)

In Grafana, the challenge of frontend metric exploration becomes pronounced as some users contend with tens of thousands of metrics. Our insights from interviews reveal a keen user desire: the ability to dynamically navigate metrics and gain familiarity with their metric landscape. Addressing this need, we introduce the Metrics Explorer—a dynamic tool tailored for users of varying expertise levels. The metrics explorer offers a flexible interface that adapts based on whether users begin their exploration with metric searches filtered by labels or vice versa, using intuitive tree diagrams to depict the relationships between metrics and labels. The metrics explorer has a variety of elements to enhance metric search and comprehension, featuring a concise tabular presentation of metric names, types, and descriptions, along with type-based filters guiding users to specific areas of interest, complemented by a fuzzy search for expedient discovery of metric names and descriptions. The results are paginated to manage lengthy lists while not truncating the actual list of metrics. Advanced users can leverage regex search for precise queries. Beyond facilitating metric exploration and insights, the metrics explorer facilitates informed decision-making in system monitoring and doubles as a valuable educational tool, nurturing the learning journey of newcomers.
