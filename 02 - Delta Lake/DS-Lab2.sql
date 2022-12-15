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
-- MAGIC 
-- MAGIC - Is an open source project which alows building a data lakehouse on top of storage systems, builds on standard formats, optimized for cloud object storage, built for scalable metadata
-- MAGIC 
-- MAGIC - Advantages
-- MAGIC   - decouples compute and storage thus providing optimized performance
-- MAGIC   - brings ACID transactions
-- MAGIC   
-- MAGIC - ACID provides transactional guarantees stands for: 
-- MAGIC   - Atomicity(transactions either succed or fail completely, no middle ground)
-- MAGIC   - Consistency(guarantee of how the state of the data is observed by simultaneous operations)
-- MAGIC   - Isolation (refers to the conflict between simultaneous operations)
-- MAGIC   - Durability(commited changes are permanent)
-- MAGIC 
-- MAGIC 
-- MAGIC - It is not
-- MAGIC   - proprietary tech (it is opens source for 3 years now)
-- MAGIC   - storage format or medium
-- MAGIC   - dbs service or dwh
-- MAGIC 
-- MAGIC - It is built on top of a standard big data format parquet

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC ### Create a Delta table Company 
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Columns: name as as string, companyId as Int, income as Double
-- MAGIC - Is this table managed or unmanaged? - table is managed
-- MAGIC - Why do we not need to specify format? - because it is by default delta format
-- MAGIC - Where is the table physicali stored? What storage and database it use?  - dbfs:/user/hive/warehouse/company it is stored in clud object storage, database is default
-- MAGIC - Make sure the cell creating the table can be run multiple times in a row

-- COMMAND ----------

-- Create the table here
CREATE TABLE IF NOT EXISTS company
(name STRING, companyId INT, income DOUBLE)

-- COMMAND ----------

DESCRIBE EXTENDED company

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Insert into the table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - What is a transaction? - a transaction is any operation that is treated as a single unit of work
-- MAGIC - What does it mean commiting a transaction? - commiting a transaction means applying the result of a transaction
-- MAGIC - Insert into the table 3 records in one transaction, values of the records you can make up
-- MAGIC - Insert into the table 2 records each one in a single transaction, values of the records you can make up
-- MAGIC - What happens if the job fails midway? - because of the atomicity property of transcations, the job does not happen

-- COMMAND ----------

-- INSERT 3 records in single transaction
INSERT INTO company VALUES
("Obambama", 421, 1432.65),
("POP-the-EYE", 632, 8865.45),
("Hairy", 221, 1.99);

-- COMMAND ----------

-- INSERT 2 records each in a different transaction
INSERT INTO company VALUES ("Armould", 666, 99.89);
INSERT INTO company VALUES ("Sparkey", 837, 12.21);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Querying a Delta table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Query your delta table customers
-- MAGIC - How would you query it if it were in a different database? SELECT * from <catalog_name>.<schema_name>.<table_name>;
-- MAGIC - How can you get older version of the table? describe hiustory of the table and then select from table as of version required
-- MAGIC - How does the versioning of delta tables work? What does it use? - it saves a state of the table after each transaction
-- MAGIC - What does happen if someone is reading at the same time you are writing into the table? -the reader continues to see a consistent view of the table
-- MAGIC - How are concurent reads handled? What are the limitations? - any read against a table will always return the most recent version of the table, the limitations are only related to the limits of object storage on cloud vendors

-- COMMAND ----------

-- Query/View your table here
SELECT * FROM company

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Update your table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Update your table customers, change some names of the companies you inserted before
-- MAGIC - How many transactions has been triggered? - only one transaction
-- MAGIC - How is concurency when updating and reading handled? - table reads ca never conflict with ongoing operations
-- MAGIC - After what time can you see the updated records in the table? - as soon as the transaction has ended
-- MAGIC - What happens if the job fails midway? - the transaction does not happen
-- MAGIC - How does the versioning work? Has a new version been created or the existing one updated? -a new version is created, with any transaction comes a new version

-- COMMAND ----------

-- Update your table here
UPDATE company 
SET name = "Hary"
WHERE companyId = 221

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Delete from your table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Delete 2 records from your table.
-- MAGIC - How many transactions has been triggered? - only one transaction
-- MAGIC - How is concurency when deleting and reading handled? - any read against a table will always return the most recent version of the table
-- MAGIC - After what time the records are removed from the table? - as soon as the transaction is complete
-- MAGIC - How does the versioning work? Has a new version been created or the existing one updated? - a new version hase been created

-- COMMAND ----------

-- Delete your table here
DELETE FROM company
WHERE companyId IN (421, 632);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Merging into your Delta table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Merge the updates defined below based on type into the company table
-- MAGIC - What advantages does MERGE bring over doing the action in doing update, delete and insert separately? - you basically do all the operations in only 1 transaction as opossed to 3 transaction which if one of them would fail, it would leave the data in an invalid state
-- MAGIC - What are the requirements on matching? MERGE statements must have at least one field to match on, and each WHEN MATCHED or WHEN NOT MATCHED optional clause can have any number of additional conditional statements
-- MAGIC - What happens if the job fails midway? - the merge does not happen, leaving the data in the state as it was before the transaction

-- COMMAND ----------

-- Updates to merge into company table
CREATE OR REPLACE TEMP VIEW updates(name, companyId, income, type) AS VALUES 
  ("Omar", 13, 24.5, "update"),
  ("", 8, 12.3, "delete"),
  ("Blue", 7, 123.5, "insert"),
  ("Diya", 15, 43.2, "update");

-- COMMAND ----------

-- Merge the above updates into company table here
MERGE INTO company c
USING updates u
ON c.companyId = u.companyId
WHEN MATCHED AND u.type = "update"
  THEN UPDATE SET *
WHEN MATCHED AND u.type = "delete"
  THEN DELETE
WHEN NOT MATCHED AND u.type = "insert" OR u.type = "update"
  THEN INSERT *

-- COMMAND ----------

-- MAGIC %md  
-- MAGIC ### Delete company table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Delete your company table
-- MAGIC - How does the delete statement behave when deleting managed and unmanaged tables? - with managed tables you also delete the underlying data because metadata and data are managed by databricks as oposed to unmanaged ones
-- MAGIC - How many transactions have been triggered? one transaction
-- MAGIC - What happens if the job fails midway? - 

-- COMMAND ----------

-- Delete your table here
-- DROP TABLE company

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
-- MAGIC - How can you explore the students table(metadata) what are the available commands to do so? - describe extended and describe detail
-- MAGIC - How many partitions does the table have, have can you change the number of partitions? - the table is not partitioned, you can partition it with PARTIOTIONED BY (column_name)
-- MAGIC - Where is the data physically located? dbfs:/user/hive/warehouse/students
-- MAGIC - What further information can you find in metadata? -  all of the info is displayed after using the describe extended and describe detail
-- MAGIC - Describe how is partitioning handled on the underlying physical storage - basically files are broken into smaller ones

-- COMMAND ----------

-- Write the first option to explore the students table in depth
DESCRIBE EXTENDED students

-- COMMAND ----------

-- Write the second option to explore the students table in depth
DESCRIBE DETAIL students

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### History of Delta Table
-- MAGIC - How can you see the history of the delta table? - with the describe history table_name command
-- MAGIC - How can you rollback to different version? - with the RESTORE TABLE command
-- MAGIC - How is the history retained? - in chronological order of the transactions
-- MAGIC - How long into the history can you go? - from to first history log that was saved, by default it's 30 days
-- MAGIC - What cleans the history? log files are automatically cleaned up after checkpoints are written, to do it manually you can use the VACUUM command
-- MAGIC - How can you change for how long the history is retained? by changing the delta.logRetentionDuration = "interval <interval>"

-- COMMAND ----------

-- Run the command to see history of students table
DESCRIBE HISTORY students

-- COMMAND ----------

-- Roll back to different vesrion in the history of stundets table
RESTORE TABLE students TO VERSION AS OF 2

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### OPTIMIZE command
-- MAGIC - What does this command do? - the OPTIMIZE command allows you to combine files toward an optimal size by combining records and rewriting results
-- MAGIC - How it is usefull? - having small files is not very efficient, as you need to open them before reading them
-- MAGIC - When it should be used? when you want to improve the speed of read queries from a table
-- MAGIC - What is the syntax of the command? - OPTIMIZE table_name
-- MAGIC - How often should the command run? - everytime you update a table

-- COMMAND ----------

-- Run the OPTIMIZE command on the students table
OPTIMIZE students

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC ### ZORDER command
-- MAGIC - What does this command do? -  speeds up data retrieval when filtering on provided fields by colocating data with similar values within data files
-- MAGIC - How it is usefull? - it reduces the amount of data that need to be read, making reads on data much faster
-- MAGIC - When it should be used? - when there are many operations done in regard to a given field
-- MAGIC - What is the syntax of the command? ZORDER BY col_name
-- MAGIC - How often should the command run? - the command is incremental but if no new data is added to a already z-ordered partition it makes no sense to z-order again
-- MAGIC - On which columns it should be used? - only on the ones that are used often, for each added column to z-order the effectiveness locally drops
-- MAGIC - How it can be switched to different column? 

-- COMMAND ----------

-- Run the ZORDER command
OPTIMIZE students
ZORDER BY id
