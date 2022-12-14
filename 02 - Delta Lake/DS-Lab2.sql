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
-- MAGIC - Delta Lake is a type of storage layer that is the pillar of the Databricks Lakehouse platform. It is an open-source project.
-- MAGIC - Advantages:
-- MAGIC   - Uses ACID transactions
-- MAGIC   - Indexing can speed up querying up to 48x
-- MAGIC   - Brings governance to the data lake
-- MAGIC - ACID means Atomicity, Consistency, Isolation and Durability - these are all needed in order to have the guarantee of proper and reliable transactions.
-- MAGIC - It is not proprietary software, or any kind of actual storage.
-- MAGIC - Delta Lake is built on top of standard data formats, mainly the parquet file format.

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
CREATE TABLE company
(name STRING, companyId INT, income DOUBLE);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - The table is managed - this is the default setting, along with the default Delta format
-- MAGIC - By default, the table is stored in the root storage location configured by the admin. The location can however be specified at the catalog or schema level. **WOULD LIKE TO GO OVER THIS TOGETHER, AS IT'S A BIT UNCLEAR TO ME**

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
INSERT INTO company VALUES
("John", 1, 15000),
("Mark", 2, 12500.60),
("Emily", 3, 11200);

-- COMMAND ----------

-- INSERT 2 records each in a different transaction
INSERT INTO company VALUES ("Bridget", 4, 11000);
INSERT INTO company VALUES ("Jonathan", 5, 10000.5);

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
SELECT * FROM company

-- If in another database:
-- SELECT * FROM databaseX.company;

-- COMMAND ----------

DESCRIBE HISTORY company

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - Delta Lake uses a transaction log in order to store the version history. With each transaction, a new version is created.
-- MAGIC - A user that reads while another writes in a table will see the latest commited version of the table. It will not interrupt any transactions.
-- MAGIC - There are no locks on reading or writing - there can be as many reads as needed - **NEED TO CONFIRM THIS**

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
UPDATE company
SET name = "Britney"
WHERE name LIKE "B%"

-- COMMAND ----------

UPDATE company
SET name = "Jonny"
WHERE name LIKE "J%"

-- COMMAND ----------

UPDATE company
SET COLUMN needs_raise

-- COMMAND ----------

DESCRIBE HISTORY company

-- COMMAND ----------

SELECT * FROM company

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - One transaction has been triggered per UPDATE command (regardless of the number of records changed).
-- MAGIC - As per the Databricks documentation, for managing concurrent transactions, Databricks uses optimistic concurrency control. This means that there are no locks on reading or writing against a table, and deadlock is not a possibility.
-- MAGIC - Updated records can be seen immediately after writing (a new read command is needed though).
-- MAGIC - If the job fails mid-way, the transaction will not take place.
-- MAGIC - A new version is created with each successful transaction. 

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
DELETE FROM company
WHERE name = "Jonny" AND income > 10000

-- COMMAND ----------

DESCRIBE HISTORY company

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - One transaction has been triggered per DELETE command (regardless of the number of records changed).
-- MAGIC - As per the Databricks documentation, for managing concurrent transactions, Databricks uses optimistic concurrency control. This means that there are no locks on reading or writing against a table, and deadlock is not a possibility. This applies for deletions as well.
-- MAGIC - Updated records can be seen immediately after deleting (a new read command is needed though).
-- MAGIC - A new version is created with each successful transaction. 

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
  ("Diya", 4, 43.2, "update");

-- COMMAND ----------

-- Merge the above updates into company table here
MERGE INTO company c
USING updates u
ON c.companyId = u.companyId
WHEN MATCHED AND u.type = "update"
  THEN UPDATE SET *
WHEN MATCHED AND u.type = "delete"
  THEN DELETE
WHEN NOT MATCHED AND u.type = "insert"
  THEN INSERT *

-- COMMAND ----------

SELECT * FROM company

-- COMMAND ----------

DESCRIBE HISTORY company

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - The main advantage for using MERGE is that we can only use one larger command, creating only one transaction for different data editing commands in a quicker way.
-- MAGIC - There needs to be at least one common column.
-- MAGIC - A merge operation can fail if multiple rows of the source dataset match and the merge attempts to update the same rows of the target Delta table. If the job fails mid-way, the transaction will not take place.

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
DELETE FROM company

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - The DELETE FROM statement deletes all table rows which match the condition (if none given, all rows are erased).
-- MAGIC - One transaction is triggered.
-- MAGIC - If the job fails mid-way, the transaction will not take place.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Create students table with history for the purposes of the next exercises**

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS students
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

-- MAGIC %python
-- MAGIC display(dbutils.fs.ls("dbfs:/user/hive/warehouse/students"))

-- COMMAND ----------

-- MAGIC %python
-- MAGIC display(dbutils.fs.ls("dbfs:/user/hive/warehouse/students/_delta_log"))

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - Table students has 4 partitions. This number can be reduced by using the OPTIMIZE command.
-- MAGIC - Storage location is "dbfs:/user/hive/warehouse/students/"
-- MAGIC - Information found in the metadata above.
-- MAGIC - Partitioning is not used by default, this is not needed nor recommended for small to medium file sizes. We could use the PARTITIONED BY command to partition by certain criteria that we would want to apply.

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
RESTORE TABLE students TO VERSION AS OF 5

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - History is retained by default for 30 days. This is how long you can go back. This time interval can be changed using "delta.logRetentionDuration = 'interval (interval)'"
-- MAGIC - The history can be cleaned using the VACUUM command. This command is normally set to be used for at least 7 days, however we can override this (risky).

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
-- MAGIC - This command combines smaller files into bigger ones.
-- MAGIC - It's useful for improving the speed of read queries from a table.
-- MAGIC - It could be used whenever we are writing into the tables.

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
OPTIMIZE students
ZORDER BY id

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - The ZORDER command colocates column information in the same set of files. This speeds up data retrieval when filtering on provided fields by colocating data with similar values within data files.
-- MAGIC - It should be used on larger sets of data.
-- MAGIC - It should be run depending on how much data is being added.
-- MAGIC - It works best when used on columns that have high number of distinct values. It can be used on several columns, however the speed/effectiveness goes down with each column added.
-- MAGIC - **Not sure if whenever we use the command it applies to the column we mention at that point, or if this is an additive command**
