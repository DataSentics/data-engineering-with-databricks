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
-- MAGIC ###Answers:
-- MAGIC 
-- MAGIC - **How you create view?** CREATE OR REPLACE VIEW view_name
-- MAGIC 
-- MAGIC - **How you create temporary view?** CREATE OR REPLACE TEMPORARY VIEW view_name
-- MAGIC 
-- MAGIC - **What is the difference between view and temporary view?** A view exists only for a single query and a temporary view exists for the entire database session in which it was created.
-- MAGIC 
-- MAGIC - **What view should you create and why?**
-- MAGIC 
-- MAGIC - **With what command you find out that view is temporary?**
-- MAGIC 
-- MAGIC - **What is a difference between table and view?**
