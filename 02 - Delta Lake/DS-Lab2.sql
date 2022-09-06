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
-- MAGIC **Your answers about Delta Lake**

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### What it is?
-- MAGIC It builds a data lakehouse on existing storage system, also it is open source
-- MAGIC 
-- MAGIC ### What advantages does it bring?
-- MAGIC It is durable, cheap and easy to scale
-- MAGIC 
-- MAGIC ### What does ACID mean? Why do we need it? 
-- MAGIC Acid is Atomicity, Consistency, Isolation, Durability
-- MAGIC It is needed so you can modify a table from different clusters at the same time.
-- MAGIC 
-- MAGIC 
-- MAGIC ### What it is not?
-- MAGIC 
-- MAGIC It's not a storage format or a database service
-- MAGIC 
-- MAGIC ### On top of what format it is built?
-- MAGIC It is built on top of a data lake

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

CREATE TABLE alexb_Company (name string, companyId int, income Double)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## #Is this table managed or unmanaged?
-- MAGIC The table is managed
-- MAGIC ### Why do we not need to specify format?
-- MAGIC Delta is already a default format
-- MAGIC ### Where is the table physicali stored? What storage and database it use?
-- MAGIC The table is stored in the cloud, is uses parquet storage and it uses the default database

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
-- (name string, companyId int, income Double)
INSERT INTO alexb_Company VALUES
('Alex', 6, 1350.2),
('George', 6, 2400),
('Alin', 2, 1660);

-- COMMAND ----------

-- INSERT 2 records each in a different transaction
INSERT INTO alexb_Company VALUES ('Pisti', 2, 2705.85);
INSERT INTO alexb_Company VALUES ('Gica', 1, 5400.90);


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
SELECT * FROM alexb_Company;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### How would you query it if it were in a different database?
-- MAGIC If you are in another databse you use [database].[schema].[table]
-- MAGIC ### How can you get older version of the table?
-- MAGIC You use RESTORE TABLE students TO VERSION AS OF 'verion_number'
-- MAGIC ### How does the versioning of delta tables work? What does it use? 
-- MAGIC When we write our data into a Delta table, every operation is automatically versioned and we can access any version of data. This allows us to travel back to a different version of the current delta table. It uses a transaction log
-- MAGIC ###  What does happen if someone is reading at the same time you are writing into the table? 
-- MAGIC Nothing, you can have multiple people reading at the same time
-- MAGIC ### How are concurent reads handled? What are the limitations?

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
UPDATE alexb_Company SET name = 'Alinus' WHERE name LIKE "Gica";

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
DELETE FROM alexb_Company WHERE companyId=6 

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
  
MERGE INTO alexb_Company cmp USING updates u
ON cmp.name=u.name 
WHEN MATCHED AND u.type = "update"
  THEN UPDATE SET *
WHEN MATCHED AND u.type = "delete"
  THEN DELETE
WHEN NOT MATCHED AND u.type = "insert"
  THEN INSERT *;

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
DROP TABLE alexb_Company

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Create students table with history for the purposes of the next exercises**

-- COMMAND ----------

CREATE TABLE students
  (id INT, name STRING, value DOUBLE);
  
INSERT INTO students VALUES (1, "Yve", 1.0);
INSERT INTO students VALUES (2, "Omar", 2.5);
INSERT INTO students VALUES (3, "Elia", 3.3);

INSERT INTO students
VALUES 
  (4, "Ted", 4.7),
  (5, "Tiffany", 5.5),
  (6, "Vini", 6.3);
  
UPDATE students 
SET value = value + 1
WHERE name LIKE "T%";

DELETE FROM students 
WHERE value > 6;

CREATE OR REPLACE TEMP VIEW updates(id, name, value, type) AS VALUES
  (2, "Omar", 15.2, "update"),
  (3, "", null, "delete"),
  (7, "Blue", 7.7, "insert"),
  (11, "Diya", 8.8, "update");
  
MERGE INTO students b
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
DESCRIBE EXTENDED students

-- COMMAND ----------

-- Write the second option to explore the students table in depth
DESCRIBE DETAIL students

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
DESCRIBE HISTORY students

-- COMMAND ----------

-- Roll back to different vesrion in the history of stundets table
RESTORE TABLE students TO VERSION AS OF 4

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
OPTIMIZE students

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
OPTIMIZE students ZORDER BY id

-- COMMAND ----------


