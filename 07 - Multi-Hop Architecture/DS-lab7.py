# Databricks notebook source
# MAGIC %md
# MAGIC 
# MAGIC #Multi-Hop architecture
# MAGIC - Multi-Hop architecture consists of three stages: Bronze, Silver and Gold. How would you describe each of these stages and their usage?
# MAGIC - What are the limitations of **complete** output mode?

# COMMAND ----------

# MAGIC %md
# MAGIC - Bronze: raw data ingested from cloud; Silver: clean data; Gold: bussiness ready aggregated data
# MAGIC - You cannot use Auto Loader from a data source written in complete output mode
