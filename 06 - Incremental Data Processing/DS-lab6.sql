-- Databricks notebook source
-- MAGIC %md
-- MAGIC #Incremental Data Ingestion
-- MAGIC - What is advantage of incremental data ingestion?
-- MAGIC - What has to be included in your stream read query to automatically use AutoLoad?
-- MAGIC - What happens when a failure occurs during a streaming read?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**

-- COMMAND ----------

-- What is advantage of incremental data ingestion?
-- ANSWER: processing only the new data reduces redundant processing

-- COMMAND ----------

-- What has to be included in your stream read query to automatically use AutoLoad?
-- ANSWER: .format("cloudFiles")

-- COMMAND ----------

-- What happens when a failure occurs during a streaming read?
-- ANSWER: streaming engine attempts to restart and/or reprocess the data

-- COMMAND ----------


