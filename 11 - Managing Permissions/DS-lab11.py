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
# MAGIC - Is a governance solution on the lakehouse. It simplifies security and governance of data by providing a central place to administer and audit data access.
# MAGIC 
# MAGIC - catalog.schema(db).table
# MAGIC 
# MAGIC - GRANT MODIFY ON TABLE cars to `john.doe@company.com`
# MAGIC - GRANT SELECT ON TABLE cars to `john.doe@company.com`
# MAGIC - GRANT ALL PRIVILEGES ON TABLE cars to `john.doe@company.com`
