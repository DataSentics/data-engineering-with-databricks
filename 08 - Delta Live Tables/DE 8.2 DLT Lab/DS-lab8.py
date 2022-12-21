# Databricks notebook source
# MAGIC %md
# MAGIC #Delta live tables
# MAGIC - What are Delta Live Tables (DLT)?
# MAGIC - What are advantages of DLT?
# MAGIC - You want to create delta live table. What command you use?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers**
# MAGIC 
# MAGIC 1. DLT is a pipeline framework; the DE defines the transformations, and DLT manages the data quality, errors, clusters...
# MAGIC 2. All transformations are applied in one go (pipeline), ensuring the end-user has access to LIVE cleaned data; all steps are triggered automatically in sqeuence, errors are handled automatically, and everything happens with the benefits of Delta Lake
# MAGIC 3. CREATE OR REFRESH STREAMING LIVE TABLE tabname
