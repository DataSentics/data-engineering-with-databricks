# Databricks notebook source
# MAGIC %md 
# MAGIC #DBSQL
# MAGIC - For what pusposis is SQL workspace used?
# MAGIC - What is purpose of SQL warehouse (formely SQL endpoint)?
# MAGIC - You want to refresh your query every day. How do you do that?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your Answers**
# MAGIC 
# MAGIC 1. Running queries, BI, dahsboards on the DB lakehouse
# MAGIC 2. SQL Warehouse is a compute resource which allows to run SQL commands on data; the user only runs the commands, the reseources ara managed by the platform
# MAGIC 3. Under 'Queries', select the query and then in the top-right corner there is a "schedule" button; probbaly the same needs to be done for the Dashboard which uses the query...?
