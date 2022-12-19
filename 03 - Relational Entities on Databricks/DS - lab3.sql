-- Databricks notebook source
-- MAGIC %md
-- MAGIC #Databases
-- MAGIC - What is a database?
-- MAGIC - You want to create a database called **customers**, but you are not sure if your colleague has alredy created the database. What command you use to run a cell without getting an error?
-- MAGIC - You want to find a database location. What command you use?
-- MAGIC - You want to drop databases you will not need anymore, but the database contains tables. How can you drop the database with one command?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - Generally speaking, a database is any ordered collection of data
-- MAGIC - create database if not exists database_name;
-- MAGIC - describe extended database_name;
-- MAGIC - drop database database_name;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables
-- MAGIC - How do you create a managed table?
-- MAGIC - How do you create a managed table from existing table? Recall CTAS statement.
-- MAGIC - How do you create a unmanaged table?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - Managed tables are the default way to create tables if location is not specified
-- MAGIC - create or replace table1 as select * from table2
-- MAGIC - you specify the location, a location which is outside of the root storage location

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
-- MAGIC - create view this_view
-- MAGIC - create temp view temp_view
-- MAGIC - Unlike regular views, temporary views are visible only to the session that created them and are dropped when the session ends
-- MAGIC - Global temp views are good to share between users within a session and then they get automatically dropped once the session ends
-- MAGIC - show tables;
-- MAGIC - a view is exclusively a virtual table, has no files associated with it and does not occupy space

-- COMMAND ----------

-- create or replace table t (name string, age int);

-- create or replace temp view v as select * from t;

-- show tables;

-- drop table t;
-- drop view v;
