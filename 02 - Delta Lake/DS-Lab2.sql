-- Databricks notebook source
-- MAGIC %md 
-- MAGIC ### Delta Lake
-- MAGIC - What it is?
-- MAGIC - What advantages does it bring?
-- MAGIC - What does ACID mean? Why do we need it? 
-- MAGIC - What it is not?
-- MAGIC - On top of what format it is built?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 
-- MAGIC ####Answer:
-- MAGIC - **What it is?** Is a open source project that enables building a data lakehouse on top of existing storage system 
-- MAGIC 
-- MAGIC - **What advantages does it bring?** It is open source, builds upon standard data formats, optimized for cloud object storage, build for scalable metadata handling
-- MAGIC 
-- MAGIC - **What does ACID mean? Why do we need it?** 
-- MAGIC 
-- MAGIC A - atomicity: transaction either succed or fail completly
-- MAGIC 
-- MAGIC C - consistency: data is in a consistent state when a transaction starts and when it ends
-- MAGIC 
-- MAGIC I - isolation: how simultanious operations conflict one to another
-- MAGIC 
-- MAGIC D - durability: commited changes are permanent
-- MAGIC 
-- MAGIC - **What it is not?** Proprietary technology, storage format, storage medium, database service or data warehouse  
-- MAGIC 
-- MAGIC - **On top of what format it is built?** Data Lake 

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC ### Create a Delta table Company 
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Columns: name as as string, companyId as Int, income as Double
-- MAGIC - Is this table managed or unmanaged?
-- MAGIC - Why do we not need to specify format?
-- MAGIC - Where is the table physicali stored? What storage and database it use?
-- MAGIC - Make sure the cell creating the table can be run multiple times in a row

-- COMMAND ----------

-- Create the table here
CREATE TABLE IF NOT EXISTS company_at
(name STRING, companyid INT, income DOUBLE)


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ####Answers:
-- MAGIC 
-- MAGIC - **Why do we not need to specify format?** The table is managed because to the unmanaged tabe you must specify the location (the path) where you create it
-- MAGIC - **Why do we not need to specify format?** Because the defined format of the table is Delta
-- MAGIC - **Where is the table physicali stored? What storage and database it use?** The table is stored inside the database directory location

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Insert into the table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - What is a transaction? 
-- MAGIC - What does it mean commiting a transaction? 
-- MAGIC - Insert into the table 3 records in one transaction, values of the records you can make up
-- MAGIC - Insert into the table 2 records each one in a single transaction, values of the records you can make up
-- MAGIC - What happens if the job fails midway?

-- COMMAND ----------

-- INSERT 3 records in single transaction
INSERT INTO company_at
VALUES 
  ("Mike", 1, 4400.5),
  ("Tiffany", 2, 9000.8),
  ("Tom", 3, 8000.0)

-- COMMAND ----------

-- INSERT 2 records each in a different transaction
INSERT INTO company_at VALUES ("Johm", 4, 4000.7);
INSERT INTO company_at VALUES ("Bob", 5, 3600.1);


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ####Answers
-- MAGIC - **What is a transaction?** A transaction is a unit of work that is performed against a database.
-- MAGIC - **What does it mean commiting a transaction?** Commiting a transaction is the updating of a record in a database
-- MAGIC - **What happens if the job fails midway?** The transaction fails because it respects the ACID principle

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Querying a Delta table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Query your delta table customers
-- MAGIC - How would you query it if it were in a different database?
-- MAGIC - How can you get older version of the table?
-- MAGIC - How does the versioning of delta tables work? What does it use? 
-- MAGIC - What does happen if someone is reading at the same time you are writing into the table? 
-- MAGIC - How are concurent reads handled? What are the limitations?

-- COMMAND ----------

-- Query/View your table here
SELECT * FROM company_at

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ####Answers
-- MAGIC 
-- MAGIC - **How would you query it if it were in a different database?** With cross-database queries, you can query data from any database in the cluster, regardless of which database you are connected to.
-- MAGIC 
-- MAGIC - **How can you get older version of the table?** Using VERSION AS OF and the number of version you want to restore
-- MAGIC 
-- MAGIC - **How does the versioning of delta tables work? What does it use?** It saves the version of the tables starting from 0 to be able to go back if mistakes are done. It is uses tables stored in the transaction log
-- MAGIC 
-- MAGIC - **What does happen if someone is reading at the same time you are writing into the table?** The readers continue to see a snapshot view of the table that the Databricks job started with, even when a table is modified during a job.
-- MAGIC 
-- MAGIC - **How are concurent threads handled? What are the limitations?** 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Update your table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Update your table customers, change some names of the companies you inserted before
-- MAGIC - How many transactions has been triggered?
-- MAGIC - How is concurency when updating and reading handled?
-- MAGIC - After what time can you see the updated records in the table?
-- MAGIC - What happens if the job fails midway?
-- MAGIC - How does the versioning work? Has a new version been created or the existing one updated?

-- COMMAND ----------

-- Update your table here
UPDATE company_at 
SET income = income - 1000
WHERE name LIKE "T%"

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Delete from your table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Delete 2 records from your table.
-- MAGIC - How many transactions has been triggered?
-- MAGIC - How is concurency when deleting and reading handled?
-- MAGIC - After what time the records are removed from the table?
-- MAGIC - How does the versioning work? Has a new version been created or the existing one updated?

-- COMMAND ----------

-- Delete your table here
DELETE FROM company_at
WHERE name LIKE "T%"

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Merging into your Delta table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Merge the updates defined below based on type into the company table
-- MAGIC - What advantages does MERGE bring over doing the action in doing update, delete and insert separately?
-- MAGIC - What are the requirements on matching? 
-- MAGIC - What happens if the job fails midway?

-- COMMAND ----------

-- Updates to merge into company table
CREATE OR REPLACE TEMP VIEW updates(name, companyId, income, type) AS VALUES 
  ("Omar", 13, 24.5, "update"),
  ("", 8, 12.3, "delete"),
  ("Blue", 7, 123.5, "insert"),
  ("Diya", 15, 43.2, "update");

-- COMMAND ----------

-- Merge the above updates into company table here
MERGE INTO company_at c
USING updates u
ON c.companyId=u.companyId
WHEN MATCHED AND u.type = "update"
  THEN UPDATE SET *
WHEN MATCHED AND u.type = "delete"
  THEN DELETE
WHEN NOT MATCHED AND u.type = "insert"
  THEN INSERT *

-- COMMAND ----------

SELECT * FROM company_at

-- COMMAND ----------

-- MAGIC %md  
-- MAGIC ### Delete company table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Delete your company table
-- MAGIC - How does the delete statement behave when deleting managed and unmanaged tables? 
-- MAGIC - How many transactions have been triggered?
-- MAGIC - What happens if the job fails midway?

-- COMMAND ----------

-- Delete your table here
DROP TABLE company_at

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Create students table with history for the purposes of the next exercises**

-- COMMAND ----------

CREATE TABLE students_at
  (id INT, name STRING, value DOUBLE);
  
INSERT INTO students_at VALUES (1, "Yve", 1.0);
INSERT INTO students_at VALUES (2, "Omar", 2.5);
INSERT INTO students_at VALUES (3, "Elia", 3.3);

INSERT INTO students_at
VALUES 
  (4, "Ted", 4.7),
  (5, "Tiffany", 5.5),
  (6, "Vini", 6.3);
  
UPDATE students_at 
SET value = value + 1
WHERE name LIKE "T%";

DELETE FROM students_at 
WHERE value > 6;

CREATE OR REPLACE TEMP VIEW updates(id, name, value, type) AS VALUES
  (2, "Omar", 15.2, "update"),
  (3, "", null, "delete"),
  (7, "Blue", 7.7, "insert"),
  (11, "Diya", 8.8, "update");
  
MERGE INTO students_at b
USING updates u
ON b.id=u.id
WHEN MATCHED AND u.type = "update"
  THEN UPDATE SET *
WHEN MATCHED AND u.type = "delete"
  THEN DELETE
WHEN NOT MATCHED AND u.type = "insert"
  THEN INSERT *;

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC ### Explore students table
-- MAGIC - Try to not consult the documentation
-- MAGIC - How can you explore the students table(metadata) what are the available commands to do so?
-- MAGIC - How many partitions does the table have, have can you change the number of partitions?
-- MAGIC - Where is the data physically located?
-- MAGIC - What further information can you find in metadata?
-- MAGIC - Describe how is partitioning handled on the underlying physical storage

-- COMMAND ----------

-- Write the first option to explore the students table in depth
DESCRIBE EXTENDED students_at

-- COMMAND ----------

-- Write the second option to explore the students table in depth
DESCRIBE DETAIL students_at

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### History of Delta Table
-- MAGIC - How can you see the history of the delta table?
-- MAGIC - How can you rollback to different version?
-- MAGIC - How is the history retained?
-- MAGIC - How long into the history can you go?
-- MAGIC - What cleans the history?
-- MAGIC - How can you change for how long the history is retained?

-- COMMAND ----------

-- Run the command to see history of students table
DESCRIBE HISTORY students_at

-- COMMAND ----------

-- Roll back to different vesrion in the history of stundets table
SELECT * FROM students_at VERSION AS OF 4

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### OPTIMIZE command
-- MAGIC - What does this command do?
-- MAGIC - How it is usefull?
-- MAGIC - When it should be used?
-- MAGIC - What is the syntax of the command?
-- MAGIC - How often should the command run? 

-- COMMAND ----------

-- Run the OPTIMIZE command on the students table
OPTIMIZE students_at

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC ### ZORDER command
-- MAGIC - What does this command do?
-- MAGIC - How it is usefull?
-- MAGIC - When it should be used?
-- MAGIC - What is the syntax of the command?
-- MAGIC - How often should the command run?
-- MAGIC - On which columns it should be used?
-- MAGIC - How it can be switched to different column? 

-- COMMAND ----------

-- Run the ZORDER command
OPTIMIZE students_at
ZORDER BY name
