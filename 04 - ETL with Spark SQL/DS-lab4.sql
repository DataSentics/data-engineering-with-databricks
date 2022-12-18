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
-- MAGIC - Parquet, json
-- MAGIC - CSV style formats
-- MAGIC - SELECT * FROM JSON.path
-- MAGIC - Yes, if the files in the directory have the same schema. In this case we only specify the directory, not the specific files in that directory.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables with external data sources
-- MAGIC 
-- MAGIC - Your looked on data from your external file and you saw that a file contains 1000 rows. You added 100 new rows, but after reloading the file you see it still contains just 1000 rows. Why? And how you can fix that?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Because it's not within Delta Lake, the chache is not refreshed. Need to use REFRESH TABLE table_name

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
-- MAGIC - It means CREATE TABLE table_name AS SELECT - creates a delta table based on another table.
-- MAGIC - Doesn't support schemas. Best to be used on parquet/json files.
-- MAGIC - CREATE TABLE companies AS SELECT * FROM parquet.`/files/raw/companies.csv`.
-- MAGIC - A generated column is a column generated from querying a specific table.
-- MAGIC - Quality assurance. The type of constraints that can be used in databricks are CHECK and NOT NULL.
-- MAGIC - The two possibilities are DEEP CLONE and SHALLOW CLONE. While the deep clone actually copies the data, the shallow clone only reffers to the source as a "snapshot".

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Writing to tables
-- MAGIC - New data engineer wants to replace the data in table named **customers**. He deleted the tables and create a new table with the same name. Describe why that approach is bad and what should be done instead. What are the benefits of the right solution?
-- MAGIC - What means CRAS statement?
-- MAGIC - You want to overwrite table, but you are not sure if the table exists. What command you use?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - Instead of deleting and creating a new table, he should use the command CREATE OR REPLACE TABLE. This uses less computing power - it's quicker and more effective. This also stores the version history of the table, which is good for backup purposes.
-- MAGIC - CREATE OR REPLACE TABLE table_name AS SELECT ...
-- MAGIC - CREATE OR REPLACE TABLE table_name

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Cleaning Data
-- MAGIC - You want to calculate missing records in column **name** as **missing names** in the table named **companies**. Write command to calculate them.
-- MAGIC - Write a query for calculating distinct values from **names** column for the table **companies**.
-- MAGIC - You have the table named **toys_dup** where is many duplicated rows. Write a query for creating a new table without duplicated columns called **toys_dedup**. 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - SELECT count(name) AS 'missing names'
-- MAGIC   FROM companies
-- MAGIC   WHERE name IS NULL
-- MAGIC - SELECT distinct(names) FROM companies
-- MAGIC - CREATE OR REPLACE TABLE toys_dedup AS
-- MAGIC   SELECT distinct(*)
-- MAGIC   FROM toys_dup

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

-- MAGIC %md
-- MAGIC #SQL UDFs
-- MAGIC - Write command for creating SQL UDF named **add_five** which adds 5 to a column and returns integer.
-- MAGIC - What is the usage of case/when construct?
