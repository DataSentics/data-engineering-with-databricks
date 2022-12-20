# Databricks notebook source
# MAGIC %md
# MAGIC 
# MAGIC #Multi-Hop architecture
# MAGIC - Multi-Hop architecture consists of three stages: Bronze, Silver and Gold. How would you describe each of these stages and their usage?
# MAGIC - What are the limitations of **complete** output mode?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers**
# MAGIC 
# MAGIC - Stages of multi-hop architecture
# MAGIC   - Bronze stage suggests raw data ingested from multiple sources, they can ocasionally be enriched with usefull metadata for troubleshooting, and allthough this may happen, the data that was added very rarely goes downstream
# MAGIC   - Silver stage consists of a higher level of enrichment, bronze tables can be joined, schemas can be modeled, data types are formatted to specific use cases, filters are applied. Basically data is in a formated and cleansed state
# MAGIC   - Gold tables usually provide the end outputs of a pipeline, data is business ready, meaning dashboards, reports and insights can be directly derived from here.
# MAGIC   
# MAGIC   
# MAGIC - We cannot read streams from this path since structured streaming assumes that data is only being appended in upstream logic and not rewritten as `complete` output mode does.
