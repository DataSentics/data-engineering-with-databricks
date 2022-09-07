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
-- MAGIC ####Answers
-- MAGIC 
-- MAGIC - **What data formats are most useful for direct querying?** JSON, parquet, delta
-- MAGIC 
-- MAGIC - **What data formats do not work with direct queries?** CSV, Txt
-- MAGIC 
-- MAGIC - **What is the syntax for direct querying of json file?** SELECT * FROM json.${directory.paths}/path_to_table;
-- MAGIC 
-- MAGIC - **Can we query files simultaneously from directory? If yes, what are the assumptions?** It is possible

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables with external data sources
-- MAGIC 
-- MAGIC - Your looked on data from your external file and you saw that a file contains 1000 rows. You added 100 new rows, but after reloading the file you see it still contains just 1000 rows. Why? And how you can fix that?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ####Answer
-- MAGIC 
-- MAGIC The changes still need to be commited and thats why the new added rows are missing

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
-- MAGIC ####Answers
-- MAGIC 
-- MAGIC - **What means CTAS and what type of table it creates?** CREATE TABLE AS SELECT. It creates managed tables
-- MAGIC 
-- MAGIC - **What are a limitations of CTAS and for what data types is suitable?** You can't define a DEFAULT constraint on a distribution column. It is sutable for all kind of data
-- MAGIC 
-- MAGIC - **Write CTAS command for creating table called companies** CREATE OR REPLACE TABLE companies AS SELECT * FROM parquet.`${da.paths.datasets}/files/raw/companies.csv`
-- MAGIC 
-- MAGIC - **What is a generated column?** A generated column is a special column that is always computed from other columns
-- MAGIC 
-- MAGIC - **What is purpose of table constraint and what type of constraints in the databricks exist?** Delta tables support standard SQL constraint management clauses that ensure that the quality and integrity of data added to a table is automatically verified. There are two types of constrains: NOT NULL and CHECK
-- MAGIC 
-- MAGIC - **What type of cloning of delta table databricks offers and what are is the difference?** In Databricks delta lake, Clones are simply copies of your delta tables at a given snapshot in time

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Writing to tables
-- MAGIC - New data engineer wants to replace the data in table named **customers**. He deleted the tables and create a new table with the same name. Describe why that approach is bad and what should be done instead. What are the benefits of the right solution?
-- MAGIC - What means CRAS statement?
-- MAGIC - You want to overwrite table, but you are not sure if the table exists. What command you use?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ####Answers:
-- MAGIC 
-- MAGIC - **What are the benefits of the right solution?** This approach is bad because it could lead to inconsistent data or data loss. The best way to modify data into a table is to use transactions
-- MAGIC 
-- MAGIC - **What means CRAS statement?** CREATE OR REPLACE AS SELECT
-- MAGIC 
-- MAGIC - **You want to overwrite table, but you are not sure if the table exists** CREATE OR REPLACE

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Cleaning Data
-- MAGIC - You want to calculate missing records in column **name** as **missing names** in the table named **companies**. Write command to calculate them.
-- MAGIC - Write a query for calculating distinct values from **names** column for the table **companies**.
-- MAGIC - You have the table named **toys_dup** where is many duplicated rows. Write a query for creating a new table without duplicated columns called **toys_dedup**. 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ####Answers
-- MAGIC 
-- MAGIC - **Write command to calculate them.** SELECT count_if(name IS NULL) AS missing_names FROM companies  
-- MAGIC 
-- MAGIC - **Write a query for calculating distinct values:** SELECT count(DISTINCT(names)) FROM companies
-- MAGIC 
-- MAGIC -  **Write a query for creating a new table without duplicated columns called** CREATE OR REPLACE TABLE toys_dedup AS SELECT DISTINCT(*) FROM toys_dup;

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
-- MAGIC ####Answers
-- MAGIC 
-- MAGIC - **How can you directly interact with the prices variable**  With collect_set(products.prices)
-- MAGIC 
-- MAGIC - **When you use explode function?**  We use the explode function when we want to put each element in an array on its own row.
-- MAGIC 
-- MAGIC - **What does collect_set function do?** collect_set function can collect unique values for a field, including fields within arrays.
-- MAGIC 
-- MAGIC - **What does flatten function do?** Allows multiple arrays to be combined into a single array.
-- MAGIC 
-- MAGIC - **What does array_distinct function do?** Function removes duplicate elements from an array.
-- MAGIC 
-- MAGIC - **Describe what these types of join do: INNER, LEFT, RIGHT, FULL**  
-- MAGIC 
-- MAGIC INNER - is the type used for selecting records that have matching values in both tables.  
-- MAGIC 
-- MAGIC LEFT - is the type used for returning all records from the left table, and the matched records from the right table.  
-- MAGIC 
-- MAGIC RIGHT - is the type used for returning all records from the right table, and the matched records from the left table.  
-- MAGIC 
-- MAGIC FULL - is the type used for returning all records when there is a match in either left or right table
-- MAGIC 
-- MAGIC - **What do set operators UNION and INTERSECT do?**  UNION returns the collection of two queries.  INTERSECT returns all rows found in both relations.  
-- MAGIC 
-- MAGIC - **What do higher order functions FILTER, EXIST, TRANSFORM AND REDUCE do?**  
-- MAGIC 
-- MAGIC FILTER - filters an array using the given lambda function.  
-- MAGIC 
-- MAGIC EXIST - tests whether a statement is true for one or more elements in an array.  
-- MAGIC 
-- MAGIC TRANSFORM - uses the given lambda function to transform all elements in an array.  
-- MAGIC 
-- MAGIC REDUCE - takes two lambda functions to reduce the elements of an array to a single value by merging the elements into a buffer, and the apply a finishing function on the final buffer.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #SQL UDFs
-- MAGIC - Write command for creating SQL UDF named **add_five** which adds 5 to a column and returns integer.
-- MAGIC - What is the usage of case/when construct?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ####Answer
-- MAGIC 
-- MAGIC - **Write command for creating SQL UDF named which adds 5 to a column and returns integer.** CREATE OR REPLACE FUNCTION add_five(number INT) RETURNS INT RETURN number + 5
-- MAGIC - **What is the usage of case/when construct?** The standard SQL syntactic construct CASE / WHEN allows the evaluation of multiple conditional statements with alternative outcomes based on table contents.
