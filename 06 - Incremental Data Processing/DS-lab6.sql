-- Databricks notebook source
-- MAGIC %md
-- MAGIC #Incremental Data Ingestion
-- MAGIC - What is advantage of incremental data ingestion?
-- MAGIC - What has to be included in your stream read query to automatically use AutoLoad?
-- MAGIC - What happens when a failure occurs during a streaming read?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**
-- MAGIC #### What is advantage of incremental data ingestion?
-- MAGIC Scalability and easy-to-use mechanism for incrementally and efficiently processing new data files as they arrive in cloud file storage.
-- MAGIC #### What has to be included in your stream read query to automatically use AutoLoad?
-- MAGIC CloudFiles options like (format and schema,location), the format cloudFiles and the directory of the source data
-- MAGIC #### What happens when a failure occurs during a streaming read?
-- MAGIC Apache Spark Streaming has included support for recovering from failures of both driver and worker machines. However, for some data sources, input data could get lost while recovering from the failures.
