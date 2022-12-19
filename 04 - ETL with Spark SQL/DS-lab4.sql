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
-- MAGIC 1. self-descriing files, like JSON or paruet
-- MAGIC 2. non-self describing, like csv; they do not err-out, but options and schema need to b provided explicity
-- MAGIC 3. ```SELECT * FROM JSON."PATH_TO/FILE/OR/FOLDER"``` (use backticks, not quote signs)
-- MAGIC 4. yes, if folder path is provided in the above syntax; the assumtpion is that all (e.g.) json files have the same structure/schema

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Tables with external data sources
-- MAGIC 
-- MAGIC - Your looked on data from your external file and you saw that a file contains 1000 rows. You added 100 new rows, but after reloading the file you see it still contains just 1000 rows. Why? And how you can fix that?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your answers**
-- MAGIC 
-- MAGIC The initial 1k read created a local cache of that data; adding 100 rows to it does not automatically refresh the local cache; Spark SQL uses the local cache; can be fixed by running `REFRESH TABLE tabname`

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
-- MAGIC 1. `CREATE [OR REPLACE] TABLE tabname AS SELECT...`; it creates `tabname` as a delta table, AS the result of a quey (e.g. - querying an external 
-- MAGIC file)
-- MAGIC 2. it does not support schema-specifying, nor OPTIONS; it will use the schema from the query; suitable when querying self-describing files (or sources with defined schema), not for csv
-- MAGIC 3. CREATE TABLE companies AS SELECT * FROM PARQUET.`/files/raw/companies.csv`
-- MAGIC 4. It is a column generated via SQL query, and not available in the original data source (can be transformation of existing columns, or something unrelated, like ingestion_timestamp)
-- MAGIC 5. Ensuring data quality, by specifying rules for columns; Databricks supports `NOT NULL` (making sure a column is not empty) and `CHECK` (expression sould evaluate to True)constraints
-- MAGIC 6. DEEP CLONE and SHALLOW CLONE; deep copies data + metadata, and is expensive, but any changes to the source data will not influence the clone; shallow only copies the metadata, and references the source data; vacuuming the source will err the cloned data (0which can be fixed with a new CLONE command)

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
-- MAGIC 1. he should have `CREATE OR REPLACE TABLE`, to that data is continuouly available (because of ACID); plus no files would have been deleted, no risk of corruption, no risk of losing everything (because time travel is possible with CRAS)
-- MAGIC 2. `CREATE OR REPLACE TABLE`
-- MAGIC 3. `CREATE OR REPLACE TABLE tabname`

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Cleaning Data
-- MAGIC - You want to calculate missing records in column **name** as **missing names** in the table named **companies**. Write command to calculate them.
-- MAGIC - Write a query for calculating distinct values from **names** column for the table **companies**.
-- MAGIC - You have the table named **toys_dup** where is many duplicated rows. Write a query for creating a new table without duplicated columns called **toys_dedup**. 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your Answers**
-- MAGIC 
-- MAGIC 1. `SELECT count_if(name IS NULL) as missing_names FROM companies`;
-- MAGIC or: `SELECT name as missing_names FROM companies where name IS NULL`;
-- MAGIC 2. `SELECT COUNT (DISTINCT(names)) FROM companies`
-- MAGIC 3. `create or replace table toys_dedup as
-- MAGIC (select distinct(*) from toys_dup)`;

-- COMMAND ----------

create or replace table testtab (id double, name string, company int);

INSERT INTO testtab VALUES
(NULL, NULL, 2),
(NULL, NULL, NULL),
(1, 'a', 1),
(1, 'a', 1),
(2, 'a', 1),
(2, 'a', 1),
(5, 'a', 1),
(NULL, NULL, NULL);

SELECT * from testtab;

-- COMMAND ----------

create or replace table de_duped as
(select distinct(*) from testtab);

SELECT * from de_duped

-- COMMAND ----------

drop table testtab;
drop table if exists de_duped;

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
-- MAGIC 1. products.price
-- MAGIC 2. when you want to create a row for each element of an array; say the array has ['a', 'b', 'c'], and you want to create 3 rows, one for each of a-b-c
-- MAGIC 3. returns an array of unique values from a field (including an array); this is uniques from a column (???)
-- MAGIC 4. combines multiple arrays into a single array
-- MAGIC 5. removes duplicate elelemtns from an array (this is uniques per row)
-- MAGIC 6. based on key matching (or not matching), the outpur will include: 
-- MAGIC - INNER: only common keys (non-matching records are removed)
-- MAGIC - LEFT: all keys from the left query, plus info (from R query) on matched records 
-- MAGIC - RIGHT: all keys from the right query, plus matching records from the L query
-- MAGIC - FULL: all keys, from both queries (matching and non-matching)
-- MAGIC 7. UNION adds records from the 2 queries, including duplicates; INTERSECT returns records which are common to both queries
-- MAGIC 8. FILTER on an array, returning (in a new column) an array containing only the elements matching the condition
-- MAGIC 
-- MAGIC EXISTS checks if any elements in an array matches the condition, returning (in a new column) true or false
-- MAGIC 
-- MAGIC TRANSFORM allows for applying functions to arrays
-- MAGIC 
-- MAGIC REDUCE: aggregates the elements of an array, using a custom aggregaction function; takes as params: the array, the start point, the function/transformation, the finish point

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #SQL UDFs
-- MAGIC - Write command for creating SQL UDF named **add_five** which adds 5 to a column and returns integer.
-- MAGIC - What is the usage of case/when construct?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Your Answers**
-- MAGIC 
-- MAGIC 1. `CREATE OR REPLACE FUNCTION add_five (numb, INT)
-- MAGIC RETURNS INT
-- MAGIC RETURN numb + 5`
-- MAGIC 
-- MAGIC 2. It allows to control the flow of multiple IFs clauses/transformations on a column basis
