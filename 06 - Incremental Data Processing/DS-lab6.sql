-- Databricks notebook source
-- MAGIC %md
-- MAGIC #Incremental Data Ingestion
-- MAGIC - What is advantage of incremental data ingestion?
-- MAGIC - What has to be included in your stream read query to automatically use AutoLoad?
-- MAGIC - What happens when a failure occurs during a streaming read?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - Because less data is being added or modified, it takes less time to validate the data, making the process a lot faster
-- MAGIC - data_source, source_format, table_name, checkpoint_directory
-- MAGIC - Due to checkpointing, it will restart from the last checkpoint
