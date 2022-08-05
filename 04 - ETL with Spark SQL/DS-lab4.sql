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


