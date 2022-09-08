-- Databricks notebook source
-- MAGIC %md
-- MAGIC #Databases
-- MAGIC - What is a database?
-- MAGIC - You want to create a database called **customers**, but you are not sure if your colleague has alredy created the database. What command you use to run a cell without getting an error?
-- MAGIC - You want to find a database location. What command you use?
-- MAGIC - You want to drop databases you will not need anymore, but the database contains tables. How can you drop the database with one command?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ###Answers:
-- MAGIC 
-- MAGIC - **What is a database?** Is an organized collection of structured information, stored in a computer system
-- MAGIC 
-- MAGIC - **What command you use to run a cell without getting an error?** IF NOT EXISTS
-- MAGIC 
-- MAGIC - **You want to find a database location. What command you use?** DESCRIBE DATABASE EXTENDED database_name
-- MAGIC 
-- MAGIC - **How can you drop the database with one command?** DROP DATABASE database_name

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables
-- MAGIC - How do you create a managed table?
-- MAGIC - How do you create a managed table from existing table? Recall CTAS statement.
-- MAGIC - How do you create a unmanaged table?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ###Answers:
-- MAGIC 
-- MAGIC - **How do you create a managed table?** CREATE TABLE IF NOT EXISTS table_name
-- MAGIC - **How do you create a managed table from existing table?** CREATE OR REPLACE TABLE table_name (...); SELECT * FROM parquet existing_name
-- MAGIC - **How do you create a unmanaged table?** CREATE TABLE IF NOT EXISTS table_name LOCATION path

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
-- MAGIC ### Answers:
-- MAGIC 
-- MAGIC - **How you create view? CREATE VIEW IF NOT EXISTS** view_name
-- MAGIC - **How you create temporary view? CREATE IF NOT EXISTS TEMPORARY VIEW** view_name
-- MAGIC - **What is the difference between view and temporary view?** Views are saved, temporary views are not persistent across multiple sessions
-- MAGIC - **You want to create a view, which be used by other users. What view should you create and why?** CREATE GLOBAL TEMPORARY VIEW, because it allows others to use it since it's in the cluster global db
-- MAGIC - **With what command you find out that view is temporary?** SHOW TABLES
-- MAGIC - **What is a difference between table and view?** A table is a query, a view is a subquery of a table
