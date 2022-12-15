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
-- MAGIC 
-- MAGIC - A database is an organized collection of data, they contain tables, views and functions
-- MAGIC 
-- MAGIC - CREATE DATABASE IF NOT EXISTS db_name
-- MAGIC 
-- MAGIC - DESCRIBE DATABASE EXTENDED db_name
-- MAGIC 
-- MAGIC - DROP DATABASE db_name CASCADE

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables
-- MAGIC - How do you create a managed table?
-- MAGIC - How do you create a managed table from existing table? Recall CTAS statement.
-- MAGIC - How do you create a unmanaged table?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**
-- MAGIC 
-- MAGIC - USE db_name; CREATE TABLE table_name with column specifications
-- MAGIC 
-- MAGIC - CREATE TABLE table_name AS SELECT ...
-- MAGIC 
-- MAGIC - The same way you create a managed table EXCEPT you specify an EXTERNAL LOCATION 

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
-- MAGIC 
-- MAGIC - CREATE VIEW view_name AS ...
-- MAGIC 
-- MAGIC - CREATE TEMPORARY VIEW temp_view_name  AS ...
-- MAGIC 
-- MAGIC - Views persist upon session cancelation whereas temporary views do not
-- MAGIC 
-- MAGIC - You would create a Global temp view because they can be shared between notebooks using the same clusters
-- MAGIC 
-- MAGIC - SHOW TABLES show info about views aswell
-- MAGIC 
-- MAGIC - A view contains no data of its own, it is like a snapshot of a table in a given state
