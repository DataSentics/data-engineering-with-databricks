# Databricks notebook source
# MAGIC %md
# MAGIC #Delta live tables
# MAGIC - What are Delta Live Tables (DLT)?
# MAGIC - What are advantages of DLT?
# MAGIC - You want to create delta live table. What command you use?

# COMMAND ----------

# MAGIC %md
# MAGIC - Delta Live Tables are basically pipelines, linking data sources to target datasets.
# MAGIC - DLTs make it easy to build and manage reliable batch and streaming data pipelines that deliver high-quality data. They help data engineering teams simplify ETL development and management with declarative pipeline development, automatic data testing, and deep visibility for monitoring and recovery.
# MAGIC - CREATE OR REFRESH STREAMING LIVE TABLE table_name AS SELECT ...
