-- Databricks notebook source
-- MAGIC %md
-- MAGIC #Incremental Data Ingestion
-- MAGIC - What is advantage of incremental data ingestion?
-- MAGIC - What has to be included in your stream read query to automatically use AutoLoad?
-- MAGIC - What happens when a failure occurs during a streaming read?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - It's efficient and quick, just adding data to the table instead of deleting. There is an option for overwriting the whole table as well, however most efficient is appending the data.
-- MAGIC - Data source, source format, table name and checkpoint directory.
-- MAGIC - If a failure occurs, the streaming engine attempts to restart and/or reprocess the data.
