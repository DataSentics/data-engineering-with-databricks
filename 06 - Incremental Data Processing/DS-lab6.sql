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
-- MAGIC - its advantage is that it only ingests new data thus reducing redundancy in processing the same data over and over
-- MAGIC 
-- MAGIC - data_source, source_format, table_name, checkpoint_directory
-- MAGIC 
-- MAGIC - the stream restarts and continues to stream data from the last checkpoint
