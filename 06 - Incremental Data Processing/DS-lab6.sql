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
-- MAGIC 1. It only processes the new data, as opposed to re-processing the whole data everytime there is an update to the source
-- MAGIC 2. data_source, source_format, target_table_name, checkpoint_directory
-- MAGIC 3. if the streaming source is replayable, Spark Structured Streaming is E2E fault-tolerant; in case of failure, it can retry the failed read; the utput is not affected, it is available to users; the failed read will only impact the output when it succeeds;
