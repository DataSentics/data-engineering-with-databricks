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
-- MAGIC 1. A collection of tables, and relationships among them; to be used for querying to generate reports, aggregates...
-- MAGIC 2. `CREATE DATABASE IF NOT EXISTS`
-- MAGIC 3. `DROP DATABASE CASCADE`

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
-- MAGIC 1. These are default in DBx; if no location is specified, or the default DBx location is specified when creating a table
-- MAGIC 2. `CREATE TABLE tabname AS (SELECT * from existing_table)`
-- MAGIC 3. By using data in an external location

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
-- MAGIC 1. `CREATE [or replace] VIEW view_name AS...`
-- MAGIC 2. `CREATE **TEMPORARY** VIEW...`
-- MAGIC 3. A view will be stored in the database, and can be accessed at any time; a temp view will not exist beyond the current session (dettach from cluster, re-open notebook); global temp view will be available till cluster termination or deletion
-- MAGIC 4. A normal view; is visible to everyone who can access the database
-- MAGIC 5. `SHOW TABLES` will also display the views; there is a column called isTemporary, true/false
-- MAGIC 6. A view is the result of a query; running the view re-runs the query on the table; views can be used as flexible tools to query existing tables (which are not that flexible); is view is not *data*, but rather just the query code to be run + the result of the latest run; the view can aggregate and join data from multiple tables

-- COMMAND ----------

-- MAGIC %python
-- MAGIC display(dbutils.fs)
-- MAGIC dbutils.fs.mkdirs('/dbacademy/testhh')

-- COMMAND ----------

CREATE DATABASE if not exists testdb LOCATION '/dbacademy/testhh';
use testdb;
CREATE TABLE IF NOT EXISTS testtable (id double, name string) ;
INSERT into testtable
VALUES (1, 'John'), (2, 'Bon'), (3, 'Jovi');

-- COMMAND ----------

describe database extended testdb

-- COMMAND ----------

describe extended testtable

-- COMMAND ----------

-- MAGIC %python
-- MAGIC display(dbutils.fs.ls('/dbacademy/testhh/testtable/'))

-- COMMAND ----------

DROp DATABASE testdb CASCADE

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.rm('/dbacademy/testhh/', recurse=True)

-- COMMAND ----------

-- MAGIC %fs ls '/dbacademy/'
