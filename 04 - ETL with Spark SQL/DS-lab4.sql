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
-- MAGIC 
-- MAGIC - self describing data fromats like parquet and json
-- MAGIC 
-- MAGIC - data formats which can have a multitude of different schemas and options (e.g. CSV files)
-- MAGIC 
-- MAGIC - select * from json. `path_to_file`
-- MAGIC 
-- MAGIC - the same as single files (e.g. select * from json. `path_to_dir`) except we specify the whole dir path and all the files need to have the same schema

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables with external data sources
-- MAGIC 
-- MAGIC - Your looked on data from your external file and you saw that a file contains 1000 rows. You added 100 new rows, but after reloading the file you see it still contains just 1000 rows. Why? And how you can fix that?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**
-- MAGIC 
-- MAGIC - because when we are querying against external data that is not in our delta lake we do not have the guarantee that we are not querying an older cache of the data, and since Spark does not auto-refresh cashed data from external sources we need to do this manually with a REFRESH command

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
-- MAGIC 
-- MAGIC - CTAS stands for a create table as select satatement and it creates a delta table with its schema infered from the query result
-- MAGIC 
-- MAGIC - CTAS statements do not provide custom schema declaration or other options so it's suitable for well defined schema data types (e.g. Parquet)
-- MAGIC 
-- MAGIC - create or replace table companies as select * from parquet. `/files/raw/companies.csv`
-- MAGIC 
-- MAGIC - a generated column represents a column that is generated automatically based on user specific logic on other columns from a table
-- MAGIC 
-- MAGIC - the purpose of table constraints is to ensure the quality and integrity of the data that is being added to tables. We have two types of constraints in DBX, a CHECK constraint and a NOT NULL constraint.
-- MAGIC 
-- MAGIC - DBX offers two types of cloning: deep and shalow. The difference between the two is that deep cloning fully copies data and metadata from source to destination while a shallow clone only copies the transaction log to destination, no real data being moved. 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Writing to tables
-- MAGIC - New data engineer wants to replace the data in table named **customers**. He deleted the tables and create a new table with the same name. Describe why that approach is bad and what should be done instead. What are the benefits of the right solution?
-- MAGIC - What means CRAS statement?
-- MAGIC - You want to overwrite table, but you are not sure if the table exists. What command you use?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**
-- MAGIC 
-- MAGIC - This is bad because by deleting the table he has limited his access to previous versions of that tables' history. He could have either used a CRAS statement or an INSERT OVERWRITE statement, operations that would have been much faster because data is not being deleted, it is only overwritten. Also the operations retain the ability to acces historical states of the previous data.
-- MAGIC 
-- MAGIC - CRAS stands for a "create or replace table as" statement.
-- MAGIC 
-- MAGIC - CRAS statement

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Cleaning Data
-- MAGIC - You want to calculate missing records in column **name** as **missing names** in the table named **companies**. Write command to calculate them.
-- MAGIC - Write a query for calculating distinct values from **names** column for the table **companies**.
-- MAGIC - You have the table named **toys_dup** where is many duplicated rows. Write a query for creating a new table without duplicated   ??? `columns` ???   called **toys_dedup**. 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your Answers**
-- MAGIC 
-- MAGIC - select count_if(name is NULL) as missing_names from companies;
-- MAGIC 
-- MAGIC - select count(distinct(names)) from companies;
-- MAGIC 
-- MAGIC - create or replace table toys_dedup as select distinct(*) from toys_dup

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
-- MAGIC 
-- MAGIC - we explode the products column to get a row for each product and then use "product.price" to refer to it
-- MAGIC 
-- MAGIC - when you want to have a row for each element from an array
-- MAGIC 
-- MAGIC - it collects unique values from a specified field
-- MAGIC 
-- MAGIC - it combines multiple array into a single array
-- MAGIC 
-- MAGIC - removes duplicates from arrays
-- MAGIC 
-- MAGIC - Joins
-- MAGIC   - INNER join returns the rows that have matching values between themselves from the refferenced tables
-- MAGIC   - LEFT join returns all of the values from the left refferenced table and matching values from the right refferenced one
-- MAGIC   - RIGHT join returns all of the values from the right refferenced table and matching values from the left refferenced one
-- MAGIC   - FULL join returns all the values from the refferenced tables
-- MAGIC   
-- MAGIC - Set operators
-- MAGIC   - UNION basically appends results from unionoed queries
-- MAGIC   - INTERSECT returns rows that are commom between queries
-- MAGIC   
-- MAGIC - Higher order functions
-- MAGIC   - FILTER filters arrays based on specific lambda functions
-- MAGIC   - EXISTS passes array elements through functions and returns boolean values.
-- MAGIC   - TRANSFORM transforms array elements using specified lambda function
-- MAGIC   - REDUCE aggregates elements in an array using a custom aggregator

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #SQL UDFs
-- MAGIC - Write command for creating SQL UDF named **add_five** which adds 5 to a column and returns integer.
-- MAGIC `create or replace function add_five(value int)
-- MAGIC returns int
-- MAGIC return value + 5`
-- MAGIC 
-- MAGIC 
-- MAGIC - What is the usage of case/when construct?: allows the evaluation of multiple conditional statements with alternative outcomes based on table contents.
