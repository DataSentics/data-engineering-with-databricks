# Databricks notebook source
# MAGIC %md 
# MAGIC #DBSQL
# MAGIC - For what pusposis is SQL workspace used?
# MAGIC - What is purpose of SQL warehouse (formely SQL endpoint)?
# MAGIC - You want to refresh your query every day. How do you do that?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your Answers**  
# MAGIC - **For what purpose is SQL workspace used?**  
# MAGIC The workspace repository resides on a database server, and can be accessed by any user with database privileges to the repository.  
# MAGIC - **What is purpose of SQL warehouse (formely SQL endpoint)?**  
# MAGIC SQL Data Warehouse stores data in relational tables using columnar storage which reduces the data storage costs, and improves query performance.
# MAGIC - **You want to refresh your query every day. How do you do that?**  
# MAGIC by schedule-ing to refresh every day using an warehouse
