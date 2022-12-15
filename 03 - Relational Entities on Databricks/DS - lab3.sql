-- Databricks notebook source
-- MAGIC %md
-- MAGIC #Databases
-- MAGIC - What is a database?
-- MAGIC - You want to create a database called **customers**, but you are not sure if your colleague has alredy created the database. What command you use to run a cell without getting an error?
-- MAGIC - You want to find a database location. What command you use?
-- MAGIC - You want to drop databases you will not need anymore, but the database contains tables. How can you drop the database with one command?

-- COMMAND ----------

DESCRIBE EXTENDED students

-- COMMAND ----------

CREATE DATABASE IF NOT EXISTS default

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - A database is an organized collection of structured information, or data, typically stored electronically in a computer system/in the cloud.
-- MAGIC - CREATE DATABASE IF NOT EXISTS customers
-- MAGIC - DESCRIBE EXTENDED DATABASE [database]
-- MAGIC - DROP DATABASE [database] CASCADE

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables
-- MAGIC - How do you create a managed table?
-- MAGIC - How do you create a managed table from existing table? Recall CTAS statement.
-- MAGIC - How do you create a unmanaged table?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - By creating the table in an internal location, it will be managed. If in an external location, it will be unmanaged.
-- MAGIC - CREATE TABLE [table_copy] AS SELECT * FROM [initial_table]
-- MAGIC - By specifying an external location when creating the table:
-- MAGIC   - CREATE TABLE [table_name] LOCATION [/external_location]

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

CREATE VIEW [view_name] AS
SELECT * FROM [table_name];

CREATE TEMPORARY VIEW [view_name] AS
SELECT * FROM [table_name];

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - A view will be stored wherever specified, while a temporary view is visible only to the session that created it and will be dropped when the session ends.
-- MAGIC - We could either create a normal view stored in a database that is accessible by others, or if we wish to create a temporary one, we should create a global temporary view, which can be seen by all the users that share the computing resources.
-- MAGIC - SHOW TABLES
-- MAGIC - A table contains actual data, while a view is just a saved query applied on an actual table.
