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
-- MAGIC **Your answers**

-- COMMAND ----------

-- What data formats are most useful for direct querying?
-- ANSWER: self-describing formats, such as parquet or JSON

-- COMMAND ----------

-- What data formats do not work with direct queries?
-- ANSWER: csv

-- COMMAND ----------

-- What is the syntax for direct querying of json file?
-- ANSWER: SELECT * FROM json.`path_tofile/file_name.json`

-- COMMAND ----------

-- Can we query files simultaneously from directory? If yes, what are the assumptions?
-- ANSWER: yes, but files must have same format and schema

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables with external data sources
-- MAGIC 
-- MAGIC - Your looked on data from your external file and you saw that a file contains 1000 rows. You added 100 new rows, but after reloading the file you see it still contains just 1000 rows. Why? And how you can fix that?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**

-- COMMAND ----------

-- Your looked on data from your external file and you saw that a file contains 1000 rows. You added 100 new rows, but after reloading the file you see it still contains just 1000 rows. Why? And how you can fix that?
-- ANWER: 

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
-- MAGIC **Your answers**

-- COMMAND ----------

-- What means CTAS and what type of table it creates?
-- ANSWER: means CREATE TABLE AS SELECT and creates managed tables

-- COMMAND ----------

-- What are a limitations of CTAS and for what data types is suitable?
-- ANSWER: do not support manual schema daclaration. CTAS are suitable for well-defined schema, such as parquet files and tables

-- COMMAND ----------

-- Write CTAS command for creating table called companies from parquet file located at: /files/raw/companies.csv
-- ANSWER: CREATE OR REPLACE TABLE companies AS
--         SELECT * FROM csv.`/files/raw/companies.csv`

-- COMMAND ----------

-- What is a generated column?
-- ANSWER: special type of columns whose values are automatically generated based on a user-specified function over other columns in the Delta table

-- COMMAND ----------

-- What is purpose of table constraint and what type of constraints in the databricks exist?
-- ANSWER: ensures that the quality and integrity of data added to a table is automatically verified. Types: NOT NULL and CHECK

-- COMMAND ----------

--  What type of cloning of delta table databricks offers and what are is the difference?
-- ANSWER: deep and shallow clone. deep clone copies data and metadata. Shallow clone copies just transaction logs without moving data

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Writing to tables
-- MAGIC - New data engineer wants to replace the data in table named **customers**. He deleted the tables and create a new table with the same name. Describe why that approach is bad and what should be done instead. What are the benefits of the right solution?
-- MAGIC - What means CRAS statement?
-- MAGIC - You want to overwrite table, but you are not sure if the table exists. What command you use?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**

-- COMMAND ----------

-- New data engineer wants to replace the data in table named customers. He deleted the tables and create a new table with the same name. Describe why that approach is bad and what should be done instead. What are the benefits of the right solution?
-- ANSWER: he should overwrite the existing data because overwriting a table is much faster, we can use time travel, overwriting is an atomic operation, due to ACID transaction guarantees, if overwriting the table fails, the table will be in its previous state.

-- COMMAND ----------

-- What means CRAS statement?
-- ANSWER: CREATE OR REPLACE AS

-- COMMAND ----------

-- You want to overwrite table, but you are not sure if the table exists. What command you use?
-- ANSWER: CREATE OR REPLACE TABLE table_name

-- COMMAND ----------

-- What are limitations of INSERT OVERWRITE?
-- ANSWER: Can only overwrite an existing table, can overwrite only with new records that match the current table schema, can overwrite individual partitions

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Cleaning Data
-- MAGIC - You want to calculate missing records in column **name** as **missing names** in the table named **companies**. Write command to calculate them.
-- MAGIC - Write a query for calculating distinct values from **names** column for the table **companies**.
-- MAGIC - You have the table named **toys_dup** where is many duplicated rows. Write a query for creating a new table without duplicated columns called **toys_dedup**. 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your Answers**

-- COMMAND ----------

-- You want to calculate missing records in column **name** as **missing names** in the table named **companies**. Write command to calculate them.
-- ANSWER: SELECT count_if(name IS NULL) AS missing_names from companies 

-- COMMAND ----------

-- Write a query for calculating distinct values from names column for the table companies.
-- ANSWER: SELECT count(DISTINCT(name)) FROM companies

-- COMMAND ----------

-- You have the table named **toys_dup** where is many duplicated rows. Write a query for creating a new table without duplicated columns called **toys_dedup**. 
-- ANSWER: CREATE OR REPLACE TABLE toys_dedup AS SELECT DISTINCT(*) FROM toys_dup

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
-- MAGIC **Your Answers**

-- COMMAND ----------

-- In a table you have column named products, that column contains array. In the array is a called prices. How can you directly interact with the prices variable
-- ANSWER: SELECT products.prices FROM table_name

-- COMMAND ----------

-- When you use explode function?
-- ANSWER: explode function puts each element in array on uts own row

-- COMMAND ----------

-- What does collect_set function do?
-- ANSWER: collect unique values for a field

-- COMMAND ----------

-- What does flatten function do?
-- ANSWER: combines multiple arrays into a single array

-- COMMAND ----------

-- What does array_distinct function do?
-- ANSWER: removes duplicates from an array

-- COMMAND ----------

-- Describe what these types of join do: INNER, LEFT, RIGHT, FULL
-- ANSWER: vim, nechce se mi vyplnovat 

-- COMMAND ----------

-- What do set operators UNION and INTERSECT do?
-- ANSWER: vim, nechce se mi vyplnovat 

-- COMMAND ----------

-- What do higher order functions FILTER, EXIST, TRANSFORM AND REDUCE do?
-- ANSWER: vim, nechce se mi vyplnovat 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #SQL UDFs
-- MAGIC - Write command for creating SQL UDF named **add_five** which adds 5 to a column and returns integer.
-- MAGIC - What is the usage of case/when construct?

-- COMMAND ----------

-- Write command for creating SQL UDF named **add_five** which adds 5 to a column and returns integer.
-- ANSWER: 
-- CREATE OR REPLACE FUNCTION add_five(number INT)
-- RETURNS INT
-- RETURNS number + 5
