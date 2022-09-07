-- Databricks notebook source


-- COMMAND ----------

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
-- MAGIC #### What data formats are most useful for direct querying?
-- MAGIC JSON, parquet, delta
-- MAGIC #### What data formats do not work with direct queries?
-- MAGIC CSV, Txt
-- MAGIC #### What is the syntax for direct querying of json file?
-- MAGIC SELECT * FROM json.`${directory.paths}/path_to_table`;
-- MAGIC #### Can we query files simultaneously from directory? If yes, what are the assumptions?
-- MAGIC Yes, we can.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables with external data sources
-- MAGIC 
-- MAGIC - Your looked on data from your external file and you saw that a file contains 1000 rows. You added 100 new rows, but after reloading the file you see it still contains just 1000 rows. Why? And how you can fix that?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**
-- MAGIC If it is not commited the data will not be uploaded, you should commit after inserting new rows.

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

-- MAGIC %md
-- MAGIC #Writing to tables
-- MAGIC - New data engineer wants to replace the data in table named **customers**. He deleted the tables and create a new table with the same name. Describe why that approach is bad and what should be done instead. What are the benefits of the right solution?
-- MAGIC - What means CRAS statement?
-- MAGIC - You want to overwrite table, but you are not sure if the table exists. What command you use?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**
-- MAGIC #### New data engineer wants to replace the data in table named customers. He deleted the tables and create a new table with the same name. Describe why that approach is bad and what should be done instead. What are the benefits of the right solution?
-- MAGIC Data loss is the top bad thing. The best way to modify is to use transactions.
-- MAGIC 
-- MAGIC #### What means CRAS statement? 
-- MAGIC CREATE OR REPLACE AS SELECT
-- MAGIC 
-- MAGIC #### You want to overwrite table, but you are not sure if the table exists 
-- MAGIC CREATE OR REPLACE

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Cleaning Data
-- MAGIC - You want to calculate missing records in column **name** as **missing names** in the table named **companies**. Write command to calculate them.
-- MAGIC - Write a query for calculating distinct values from **names** column for the table **companies**.
-- MAGIC - You have the table named **toys_dup** where is many duplicated rows. Write a query for creating a new table without duplicated columns called **toys_dedup**. 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your Answers**
-- MAGIC #### You want to calculate missing records in column **name** as **missing names** in the table named **companies**. Write command to calculate them.
-- MAGIC SELECT name FROM companies Where name is null 
-- MAGIC #### Write a query for calculating distinct values from **names** column for the table **companies**.
-- MAGIC SELECT DISTINCT(names) FROM companies
-- MAGIC #### You have the table named **toys_dup** where is many duplicated rows. Write a query for creating a new table without duplicated columns called **toys_dedup**.
-- MAGIC CREATE OR REPLACE TABLE toys_dedup AS SELECT DISTINCT(*) FROM toys_dedup;

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

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your Answers**
-- MAGIC #### Write command for creating SQL UDF named **add_five** which adds 5 to a column and returns integer.
-- MAGIC CREATE OR REPLACE FUNCTION add(number INT)
-- MAGIC RETURNS INT
-- MAGIC RETURN number + 5
-- MAGIC #### What is the usage of case/when construct?
-- MAGIC Evaluates statements with different outcomes
