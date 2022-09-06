-- Databricks notebook source
-- MAGIC %md
-- MAGIC #Databases
-- MAGIC - What is a database?
-- MAGIC - You want to create a database called **customers**, but you are not sure if your colleague has alredy created the database. What command you use to run a cell without getting an error?
-- MAGIC - You want to find a database location. What command you use?
-- MAGIC - You want to drop databases you will not need anymore, but the database contains tables. How can you drop the database with one command?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**
-- MAGIC - **What is a database?**  
-- MAGIC A database is information that is set up for easy access, management and updating
-- MAGIC - **You want to create a database called customers, but you are not sure if your colleague has alredy created the database. What command you use to run a cell without getting an error?**  
-- MAGIC CREATE DATABASE IF NOT EXISTS customers  
-- MAGIC - **You want to find a database location. What command you use?**  
-- MAGIC DESCRIBE DATABASE EXTENDED and in the filed Location we can see the location 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables
-- MAGIC - How do you create a managed table?
-- MAGIC - How do you create a managed table from existing table? Recall CTAS statement.
-- MAGIC - How do you create a unmanaged table?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**
-- MAGIC - **How do you create a managed table?**  
-- MAGIC CREATE TABLE table_name
-- MAGIC - **How do you create a managed table from existing table? Recall CTAS statement.**
-- MAGIC CREATE TABLE table_name AS  
-- MAGIC SELECT * FROM existing_table_name 
-- MAGIC - **How do you create a unmanaged table?**
-- MAGIC CREATE TABLE table_name LOCATION path ...some query... 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Views
-- MAGIC - How you create view?
-- MAGIC - How you create temporary view?
-- MAGIC - What is the difference between view and temporary view?
-- MAGIC - You want to create a view, which be used by other users. What view should you create and why?
-- MAGIC - With what command you find out that view is temporary?
-- MAGIC - What is a difference between table and view?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**
-- MAGIC - **How you create view?**  
-- MAGIC CREATE VIEW view_name AS ..some query..
-- MAGIC - **How you create temporary view?**  
-- MAGIC CREATE TEMP VIEW view_name_temp AS ..some query..
-- MAGIC - **What is the difference between view and temporary view?**  
-- MAGIC  Temp views are tied to a Spark session and as such are not accessible from another session
-- MAGIC - **You want to create a view, which be used by other users. What view should you create and why?**  
-- MAGIC 
-- MAGIC - **With what command you find out that view is temporary?**  
-- MAGIC SHOW TABLES; and in the output if the isTemporary is true that means that is temporary
-- MAGIC - **What is a difference between table and view?**  
-- MAGIC A table is structured with columns and rows, while a view is a virtual table extracted from a database. 
