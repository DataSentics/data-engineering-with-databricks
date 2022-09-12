# Databricks notebook source
# MAGIC %md
# MAGIC 
# MAGIC #Managing Permissions
# MAGIC - What is Unity Catalog?
# MAGIC - What is order in three-layer namespace with Unity Catalog?
# MAGIC - You are an administrator and you want to give ability to add, delete, and modify data to or from an object to user **john.doe@company.com** on the table named **cars**. What command you use?
# MAGIC - You are an administrator and you want to give ability read access to an object to user **john.doe@company.com** on the table named **cars**. What command you use?
# MAGIC - You are an administrator and you want to give gives all privileges to user **john.doe@company.com** on the table named **cars**. What command you use?

# COMMAND ----------

# MAGIC %md
# MAGIC 
# MAGIC **Your Answers**
# MAGIC #### What is Unity Catalog?
# MAGIC Unity Catalog is a unified governance solution for all data and AI assets including files, tables, machine learning models and dashboards in your lakehouse on any cloud.
# MAGIC #### What is order in three-layer namespace with Unity Catalog?
# MAGIC Catalogs, schemas, and tables
# MAGIC #### You are an administrator and you want to give ability to add, delete, and modify data to or from an object to user john.doe@company.com on the table named cars. What command you use?
# MAGIC GRANT ADD ON cars TO john.doe@company.com
# MAGIC GRANT DELETE ON cars TO john.doe@company.com
# MAGIC GRANT MODIFY ON cars TO john.doe@company.com
# MAGIC #### You are an administrator and you want to give ability read access to an object to user john.doe@company.com on the table named cars. What command you use?
# MAGIC GRANT READ ON cars TO john.doe@company.com
# MAGIC #### You are an administrator and you want to give gives all privileges to user john.doe@company.com on the table named cars. What command you use?
# MAGIC GRANT ALL PRIVILEGES ON cars TO john.doe@company.com
