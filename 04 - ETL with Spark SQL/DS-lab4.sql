-- Databricks notebook source
-- MAGIC %md
-- MAGIC 
-- MAGIC #Querying Data Directly from Files
-- MAGIC - What data formats are most useful for direct querying?
-- MAGIC - What data formats do not work with direct queries?
-- MAGIC - What is the syntax for direct querying of json file?
-- MAGIC - Can we query files simultaneously from directory? If yes, what are the assumptions?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - parquet, json
-- MAGIC - csv
-- MAGIC - SELECT * FROM json.`path`
-- MAGIC - Yes

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables with external data sources
-- MAGIC 
-- MAGIC - Your looked on data from your external file and you saw that a file contains 1000 rows. You added 100 new rows, but after reloading the file you see it still contains just 1000 rows. Why? And how you can fix that?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - REFRESH TABLE table_name

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Delta tables
-- MAGIC - What means CTAS and what type of table it creates?
-- MAGIC - What are a limitations of CTAS and for what data types is suitable?
-- MAGIC - Write CTAS command for creating table called companies from parquet file located at: /files/raw/companies.csv
-- MAGIC - What is a generated column?
-- MAGIC - What is purpose of table constraint and what type of constraints in the databricks exist?
-- MAGIC - What type of cloning of delta table databricks offers and what are is the difference?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - CREATE TABLE table_name AS - will create delta tables
-- MAGIC - 
-- MAGIC - CREATE TABLE table_name AS SELECT * FROM parquet.`/files/raw/companies.csv`
-- MAGIC - A generated column is a column computed from other columns
-- MAGIC - CHECK and NOT NULL - enforced contraints ensure that the quality and integrity of data
-- MAGIC - DEEP and SHALLOW - unlike deep clones, shallow clones do not copy over the data from the source

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Writing to tables
-- MAGIC - New data engineer wants to replace the data in table named **customers**. He deleted the tables and create a new table with the same name. Describe why that approach is bad and what should be done instead. What are the benefits of the right solution?
-- MAGIC - What means CRAS statement?
-- MAGIC - You want to overwrite table, but you are not sure if the table exists. What command you use?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - INSERT OVERWRITE is faster 
-- MAGIC - 
-- MAGIC - CREATE OR REPLACE TABLE IF NOT EXISTS

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Cleaning Data
-- MAGIC - You want to calculate missing records in column **name** as **missing names** in the table named **companies**. Write command to calculate them.
-- MAGIC - Write a query for calculating distinct values from **names** column for the table **companies**.
-- MAGIC - You have the table named **toys_dup** where is many duplicated rows. Write a query for creating a new table without duplicated columns called **toys_dedup**. 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - select (count(*) - count(name)) from companies;
-- MAGIC - select count(distinct(names)) from companies;
-- MAGIC - create or replace table toys_dedup as select distinct(*) from toys_dup;
-- MAGIC       

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 
-- MAGIC #Advanced SQL transformations
-- MAGIC - In a table you have column named **products**, that column contains array. In the array is a  called **prices**. How can you directly interact with the prices variable 
-- MAGIC - When you use explode function?
-- MAGIC - What does collect_set function do?
-- MAGIC - What does flatten function do?
-- MAGIC - What does array_distinct function do?
-- MAGIC - Describe what these types of join do: INNER, LEFT, RIGHT, FULL
-- MAGIC - What do set operators UNION and INTERSECT do?
-- MAGIC - What do higher order functions FILTER, EXIST, TRANSFORM AND REDUCE do?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - select products.prices
-- MAGIC - When you want to make a separate row for each element of an array value
-- MAGIC - Returns an array consisting of all unique values within the group
-- MAGIC - Transforms an array of arrays into a single array
-- MAGIC - Removes duplicate values from arrays
-- MAGIC - 
-- MAGIC -
-- MAGIC - FILTER is used to filter an array using a lambda type function
-- MAGIC   EXISTS returns true if the lambda function is true for any element in expr or query returns at least one row
-- MAGIC   TRANSFORM transforms the lements in an array using a lambda function
-- MAGIC   REDUCE aggregates elements in an array using a custom aggregator

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #SQL UDFs
-- MAGIC - Write command for creating SQL UDF named **add_five** which adds 5 to a column and returns integer.
-- MAGIC - What is the usage of case/when construct?

-- COMMAND ----------

CREATE OR REPLACE FUNCTION add_five(nr int)
RETURNS int
RETURN nr + 5

-- CASE WHEN is similar to if/else


