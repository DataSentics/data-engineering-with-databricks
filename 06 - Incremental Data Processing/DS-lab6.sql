-- Databricks notebook source
-- MAGIC %md
-- MAGIC #Incremental Data Ingestion
-- MAGIC - What is advantage of incremental data ingestion?
-- MAGIC - What has to be included in your stream read query to automatically use AutoLoad?
-- MAGIC - What happens when a failure occurs during a streaming read?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ####Answer
-- MAGIC 
-- MAGIC - **What is advantage of incremental data ingestion?** Efficiently processing new data files as they arrive in cloud file storage and scalable.
-- MAGIC - **What has to be included in your stream read query to automatically use AutoLoad?** The format cloudFiles and the directory of the source data
-- MAGIC - **What happens when a failure occurs during a streaming read?** Streaming has support for recovering from failures of both driver and worker machines, but for some data sources, input data could get lost while recovering.
