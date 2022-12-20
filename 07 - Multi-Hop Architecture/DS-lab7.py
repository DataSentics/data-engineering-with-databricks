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
# MAGIC 1. 
# MAGIC - Bronze is generally raw data, ingested from various sources; keeps full track of data history, and serves as and query-efficint source for Silver and Bronze; efficient storage; may be enriched with some additional data on ingestion (e.g: source filename, time stamps)
# MAGIC - Silver is cleansed bronze, enriched with additional data from other tables (Joins); updates also go in Silver no aggregates here (same granulation level as bronze), because...
# MAGIC - ...Gold are business-ready aggregates of Silvers; from Gold, data goes straight to business users and decision makers, via BI, dashboards, etc
# MAGIC 
# MAGIC 2. it overwrites the whole data, which can be time consuming; a Stream cannot be read from a table written as `complete`
