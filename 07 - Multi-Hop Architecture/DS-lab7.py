# Databricks notebook source
# MAGIC %md
# MAGIC 
# MAGIC #Multi-Hop architecture
# MAGIC - Multi-Hop architecture consists of three stages: Bronze, Silver and Gold. How would you describe each of these stages and their usage?
# MAGIC - What are the limitations of **complete** output mode?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers**
# MAGIC #### Multi-Hop architecture consists of three stages: Bronze, Silver and Gold. How would you describe each of these stages and their usage?
# MAGIC - Bronze is the first verision of data, raw and not touched.
# MAGIC - Silver is improving and refining of data.
# MAGIC - Gold is the business level of data used for reporting and analysis.
# MAGIC #### What are the limitations of complete output mode?
# MAGIC When using complete output mode, we rewrite the entire state of our table each time our logic runs. While this is ideal for calculating aggregates, we cannot read a stream from this directory, as Structured Streaming assumes data is only being appended in the upstream logic.
