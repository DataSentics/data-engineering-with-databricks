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

-- COMMAND ----------

-- What is a database?
-- ANSWER: database is a collection of data objects, such as tables or views and functions

-- COMMAND ----------

-- You want to create a database called customers, but you are not sure if your colleague has alredy created the database. What command you use to run a cell without getting an error?
-- ANSWER: CREATE DATABASE IF NOT EXISTS customers

-- COMMAND ----------

-- You want to find a database location. What command you use?
-- ANSWER: DESCRIBE DATABASE database_name

-- COMMAND ----------

-- You want to drop databases you will not need anymore, but the database contains tables. How can you drop the database with one command?
-- ANSWER: DROP DATABASES database_name CASCADE

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables
-- MAGIC - How do you create a managed table?
-- MAGIC - How do you create a managed table from existing table? Recall CTAS statement.
-- MAGIC - How do you create a unmanaged table?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**

-- COMMAND ----------

-- How do you create a managed table?
-- ANSWER: CREATE TABLE table_name (field_name1 INT, field_name2 STRING)

-- COMMAND ----------

-- How do you create a managed table from existing table? Recall CTAS statement.
-- ANSWER: CREATE TABLE table_name AS SELECT * FROM another_table

-- COMMAND ----------

-- How do you create a unmanaged table?
-- ANSWER: 
-- CREATE TABLE table_name
-- (field_name1 INT, field_name2 STRING)
-- LOCATION '/path/to/empty/directory'

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

-- COMMAND ----------

-- How you create view?
-- ANSWER: CREATE VIEW view_name AS ...

-- COMMAND ----------

-- How you create temporary view?
-- ANSWER: CREATE TEMPORARY VIEW view_name AS ...

-- COMMAND ----------

-- What is the difference between view and temporary view?
-- ANSWER: temporary view is session-scoped and is dropped when session ends. e.g. after detaching a cluster from notebook, the view does not exist

-- COMMAND ----------

-- You want to create a view, which be used by other users. What view should you create and why?
-- ANSWER: we create view, because temporary views are not accesible in other sessions

-- COMMAND ----------

-- With what command you find out that view is temporary?
-- ANSWER: SHOW TABLES

-- COMMAND ----------

-- What is a difference between table and view?
-- ANSWER: table contains "real" data, on the other hand view is virtualized table
