-- Databricks notebook source
-- MAGIC %md
-- MAGIC #Databases
-- MAGIC - What is a database?
-- MAGIC - You want to create a database called **customers**, but you are not sure if your colleague has alredy created the database. What command you use to run a cell without getting an error?
-- MAGIC - You want to find a database location. What command you use?
-- MAGIC - You want to drop databases you will not need anymore, but the database contains tables. How can you drop the database with one command?

-- COMMAND ----------

create database if not exists customers;
describe schema customers

-- COMMAND ----------

-- MAGIC %md
-- MAGIC * A database is information that is set up for easy access, management and updating.
-- MAGIC * `create database if not exists customers`
-- MAGIC * `describe schema customers`
-- MAGIC * `DROP DATABASE customers CASCADE`

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables
-- MAGIC - How do you create a managed table?
-- MAGIC - How do you create a managed table from existing table? Recall CTAS statement.
-- MAGIC - How do you create a unmanaged table?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC * They are default in Dbx ant the location is placed in the hive
-- MAGIC * `CREATE TABLE table_name AS (SELECT * FROM the_other_table`)
-- MAGIC * The unmanaged table is creating by specifying a location at the time of creation

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
-- MAGIC * `CREATE VIEW view_name`
-- MAGIC * `CREATE TEMPORARY VIEW temporary_view_name`
-- MAGIC * A view will be stored in the database, and can be accessed at any time; a temp view will not exist beyond the current session (dettach from cluster, re-open notebook); global temp view will be available till cluster termination or deletion
-- MAGIC * a view that is available across multiple sessions and users
-- MAGIC * `SHOW TABLES`
-- MAGIC * A table consists in rows and columns to store and organized data in a structured format, while a view is a result set of SQL statements. A view is a virtual table extracted from a database.
