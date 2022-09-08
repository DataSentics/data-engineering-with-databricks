-- Databricks notebook source
-- MAGIC %md
-- MAGIC #Incremental Data Ingestion
-- MAGIC - What is advantage of incremental data ingestion?
-- MAGIC - What has to be included in your stream read query to automatically use AutoLoad?
-- MAGIC - What happens when a failure occurs during a streaming read?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**
-- MAGIC 
-- MAGIC 1. the advantage is that we process only the new data
-- MAGIC 
-- MAGIC 2. it is automatically included when the filse comes from the cloud storage
-- MAGIC 
-- MAGIC 3. the process try to restart or reprocess the data
