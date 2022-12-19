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
-- MAGIC * json
-- MAGIC * csv
-- MAGIC * `select * from json.'json_file_path'`
-- MAGIC * yes, should schema match

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables with external data sources
-- MAGIC 
-- MAGIC - Your looked on data from your external file and you saw that a file contains 1000 rows. You added 100 new rows, but after reloading the file you see it still contains just 1000 rows. Why? And how you can fix that?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC * needs refresh because the Spark doesn't know the cache has changed

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
-- MAGIC * CTAS stands for Create Table As and it creates tables from queries. Those tables take the schema from the query.
-- MAGIC * CTAS do not support schemas. They take the schemas from the query or the schema describing files (json, parquet)
-- MAGIC * `CREATE TABLE companies AS SELECT * FROM parquet.'/files/raw/companies.csv'`
-- MAGIC * a generated column is creatd with a CTAS and it is created from data in the query (transformation, cast)
-- MAGIC * Dbx supports two types of constraints: non null and check. A table constraint makes sure that no incorrect data is inserted in the table.
-- MAGIC * Databricks offers the DEEP CLONE and the SHALLOW CLONE options. The later does not bring the data with it, but just the metadata

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Writing to tables
-- MAGIC - New data engineer wants to replace the data in table named **customers**. He deleted the tables and create a new table with the same name. Describe why that approach is bad and what should be done instead. What are the benefits of the right solution?
-- MAGIC - What means CRAS statement?
-- MAGIC - You want to overwrite table, but you are not sure if the table exists. What command you use?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC * the more efficient approach is to overwrite the data in the table using the CREATE OR REPLACE command. This way the data from the table will still be available as one of the vesions stored
-- MAGIC * CRAS stands for CREATE OR REPLACE TABLE AS
-- MAGIC * `CREATE TABLE name_of_table IF NOT EXISTS`

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Cleaning Data
-- MAGIC - You want to calculate missing records in column **name** as **missing names** in the table named **companies**. Write command to calculate them.
-- MAGIC - Write a query for calculating distinct values from **names** column for the table **companies**.
-- MAGIC - You have the table named **toys_dup** where is many duplicated rows. Write a query for creating a new table without duplicated columns called **toys_dedup**. 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC * `SELECT count_if(name is NULL) as missing_names FROM companies;`
-- MAGIC * `SELECT DISTINCT(name) FROM companies`
-- MAGIC * `CREATE TABLE toys_dedup AS SELECT DISTINCT * FROM toys_dup`
-- MAGIC * ... my practice exercises below:

-- COMMAND ----------

Create or replace table exercise(id bigint , name string, price double)

-- COMMAND ----------

insert into exercise values
(1, 'one', null),
(2, 'two', 5.5),
(3, null , 6.7),
(4, null, null),
(7, 'seven', 8.8),
(1, 'one', null),
(2, 'two', 5.5),
(1, 'one', 5.5),
(7, 'seven', 8.8),
(7, 'seven', 8.8),
(7, 'seven', 8.8)


-- COMMAND ----------

select * from exercise

-- COMMAND ----------

select count_if(price is not null) as known_prices from exercise;

-- COMMAND ----------

select count_if(price is null) as unknown_prices from exercise;

-- COMMAND ----------

create or replace table dedup2 as select distinct * from exercise;
select * from dedup2

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
-- MAGIC * column:prices
-- MAGIC * when you want to create a row for each element of an array in a column
-- MAGIC * collect_set function is used to create an array column by merging rows
-- MAGIC * flatten function is used to create a single array from an array of arrays
-- MAGIC * array_distinct returns distinct values from the array after removing duplicates
-- MAGIC * INNER JOIN merges horizontally two tables keeping only the common values
-- MAGIC    - LEFT JOIN merges horizontally two tables keeping the common values and the ones in the left table (nulls, for the corresponding colums in the right table)
-- MAGIC    _ RIGTH JOIN merges horizontally two tables keeping the common values and the ones in the rigth table (nulls, for the corresponding colums in the left table)
-- MAGIC    _ FULL JOIN merges horizontally two tables keeping the common values, the values notmatched in the left table, and the values not matched in the rigth table
-- MAGIC * The UNION merges two tables vertically if the number of colums and its type of data matches and returns the rows that are found in either relation
-- MAGIC * the INTERSECT returns the rows that are found in both relations
-- MAGIC * FILTER: Returns a new array that contains only elements for which the function returned True
-- MAGIC * EXIST: Flags if a condition is true for one or more elements in an array
-- MAGIC * TRANSFORM: transforms each of the elements in an array using a lambda function
-- MAGIC * REDUCE: reduces the elements of an array to a single value using two lambda functions by merging two elements in a buffer and applying the second function to the final buffer.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #SQL UDFs
-- MAGIC - Write command for creating SQL UDF named **add_five** which adds 5 to a column and returns integer.
-- MAGIC - What is the usage of case/when construct?
