-- Databricks notebook source
-- MAGIC %md
-- MAGIC #Databases
-- MAGIC - What is a database?
-- MAGIC A database is a collection o data that is set up for easy access, management and updating
-- MAGIC - You want to create a database called **customers**, but you are not sure if your colleague has alredy created the database. What command you use to run a cell without getting an error? Create IF NOT EXISTS customers
-- MAGIC - You want to find a database location. What command you use?
-- MAGIC DESCRIBE DATABASE EXTENDED
-- MAGIC - You want to drop databases you will not need anymore, but the database contains tables. How can you drop the database with one command?
-- MAGIC DROP DATABASE db_name CASCADE

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables
-- MAGIC - How do you create a managed table?
-- MAGIC CREATE TABLE tb_name
-- MAGIC - How do you create a managed table from existing table? Recall CTAS statement.
-- MAGIC CREATE TABLE
-- MAGIC tb_name AS
-- MAGIC SELECT * FROM existing_tb_name
-- MAGIC - How do you create a unmanaged table?
-- MAGIC CREATE TABLE table_name LOCATION path

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Views
-- MAGIC - How you create view?
-- MAGIC CREATE VIEW view_name AS 
-- MAGIC - How you create temporary view?
-- MAGIC CREATE TEMP VIEW view_name_temp AS
-- MAGIC - What is the difference between view and temporary view?
-- MAGIC temp views are bound to a session 
-- MAGIC - You want to create a view, which be used by other users. What view should you create and why?
-- MAGIC Global temporary views are primarily used to share within a session and then get automatically dropped once the session ends. These views also serve as a temporary table on which SQL queries can be made and are stored in database global_temp
-- MAGIC - With what command you find out that view is temporary?
-- MAGIC SHOW TABLES-in the output
-- MAGIC - What is a difference between table and view?
-- MAGIC  

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**
