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

# COMMAND ----------

# What is Unity Catalog?
# ANSWER: Unity Catalog is a unified governance solution for all data and AI assets including files, tables and machine learning models in your lakehouse on any cloud

# COMMAND ----------

# What is order in three-layer namespace with Unity Catalog?
# ANSER: catalog.schema.table

# COMMAND ----------

# You are an administrator and you want to give ability to add, delete, and modify data to or from an object to user john.doe@company.com on the table named cars. What command you use?
# ANSWER: GRANT MODIFY ON TABLE cars TO john.doe@company.com

# COMMAND ----------

# You are an administrator and you want to give ability read access to an object to user **john.doe@company.com** on the table named **cars**. What command you use?
# ASNWER: GRANT SELECT ON TABLE cars TO john.doe@company.com

# COMMAND ----------

# You are an administrator and you want to give gives all privileges to user **john.doe@company.com** on the table named **cars**. What command you use?
# ANSWER: GRANT ALL PRIVILEGES ON TABLE cars TO john.doe@company.com

# COMMAND ----------


