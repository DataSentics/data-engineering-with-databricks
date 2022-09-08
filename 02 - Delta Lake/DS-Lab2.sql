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
-- MAGIC # Delta Lake
-- MAGIC 
-- MAGIC ## What is it?
-- MAGIC Delta Lake is an open format storage layer that delivers reliability, security and performance on your data lake — for both streaming and batch operations.
-- MAGIC By replacing data silos with a single home for structured, semi-structured and unstructured data, Delta Lake is the foundation of a cost-effective, highly scalable lakehouse.
-- MAGIC 
-- MAGIC ## What advantages does it bring?
-- MAGIC Delta lake provides snapshot isolation which helps concurrent read/write operations and enables efficient insert, update, deletes, and rollback capabilities. It allows background file optimization through compaction and z-order partitioning achieving better performance improvements.
-- MAGIC 
-- MAGIC ## What does ACID mean? Why do we need it?
-- MAGIC ACID stands for:
-- MAGIC 
-- MAGIC - Atomicity
-- MAGIC - Consistency
-- MAGIC - Isolation
-- MAGIC - Durability
-- MAGIC 
-- MAGIC We need it to guarantee that transactions are successful.
-- MAGIC 
-- MAGIC ## What is it not?
-- MAGIC 
-- MAGIC Delta Lake is only an open format storage layer, nothing else.
-- MAGIC 
-- MAGIC ## On top of what format is it built?
-- MAGIC 
-- MAGIC It is built on open format storage.

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

-- MAGIC %md
-- MAGIC The table is managed by HIVE because I did not specify a path for the table to be saved in physically, therefore it is managed.
-- MAGIC 
-- MAGIC ### Managed Table
-- MAGIC 
-- MAGIC - Managed tables are Hive owned tables where the entire lifecycle of the tables' data are managed and controlled by Hive. External tables are tables where Hive has loose coupling with the data. 
-- MAGIC - All the write operations to the Managed tables are performed using Hive SQL commands.
-- MAGIC 
-- MAGIC ### Unmanaged Table
-- MAGIC 
-- MAGIC - Unmanaged tables will always specify a LOCATION during table creation; you can either register an existing directory of data files as a table or provide a path when a table is first defined.
-- MAGIC 
-- MAGIC We don't need to specify format because it automatically stores it in the **Delta Lake**
-- MAGIC 
-- MAGIC The table is physically stored in DBFS
-- MAGIC 
-- MAGIC The storage is Delta Lake, and it uses the database located in the variable **`DA.paths.user_db`**

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS Company
(name STRING, companyId INT, income DOUBLE);
select * from Company

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

-- MAGIC %md
-- MAGIC # Transactions
-- MAGIC - A database transaction delimits a set of database operations that are processed as a whole.
-- MAGIC - Database operations included inside a transaction are validated or canceled as a unique operation. The database server is in charge of data concurrency and data consistency .
-- MAGIC 
-- MAGIC # Commiting a Transaction
-- MAGIC It means that the transaction was done successfully and was applied to the database.
-- MAGIC 
-- MAGIC # What happens if the job fails midway?
-- MAGIC Every change is discarded and the database stays unchanged.
-- MAGIC 
-- MAGIC **Chances are it will not even run in the first place, as it will most likely throw an error before execution**

-- COMMAND ----------

INSERT INTO Company
VALUES
  ("name1", 1, 10.155),
  ("name2", 2, 15.2921),
  ("name3", 3, 24.2219)

-- COMMAND ----------

INSERT INTO Company VALUES("name4", 4, 212.222);
INSERT INTO Company VALUES("name5", 5, 1.112);

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

-- MAGIC %md
-- MAGIC ***Instruction error: There is no table "customers". I have queried the table Company.***
-- MAGIC 
-- MAGIC ### How would you query it if it were in a different database?
-- MAGIC I would first specify the database with the command **`USE {DATABASE_NAME}`**, then query it normally.
-- MAGIC 
-- MAGIC ### How to get older versions of the table?
-- MAGIC By using the command **`DESCRIBE HISTORY {table_name}`**
-- MAGIC 
-- MAGIC ### How does the versioning of delta tables work? What does it use?
-- MAGIC - The transaction log for a Delta table contains protocol versioning information that supports Delta Lake evolution.
-- MAGIC - Delta Lake tracks minimum reader and writer versions separately.
-- MAGIC - Delta Lake guarantees backward compatibility. A higher protocol version of Delta Lake reader is always able to read data that was written by a lower protocol version.
-- MAGIC 
-- MAGIC ### What does happen if someone is reading at the same time you are writing into the table?
-- MAGIC 
-- MAGIC Because Delta Lake has ACID properties and concurrency control, this will happen:
-- MAGIC - Multiple writers across multiple clusters can simultaneously modify a table partition and see a consistent snapshot view of the table and there will be a serial order for these writes.
-- MAGIC - Readers continue to see a consistent snapshot view of the table that the Databricks job started with, even when a table is modified during a job.
-- MAGIC 
-- MAGIC ### How are concurent reads handled? What are the limitations?
-- MAGIC 
-- MAGIC Delta Lake uses optimistic concurrency control to provide transactional guarantees between writes. Under this mechanism, writes operate in three stages:
-- MAGIC - **Read**: Reads (if needed) the latest available version of the table to identify which files need to be modified (that is, rewritten).
-- MAGIC - **Write**: Stages all the changes by writing new data files.
-- MAGIC - **Validate & Commit**: Before committing the changes, checks whether the proposed changes conflict with any other changes that may have been concurrently committed since the snapshot that was read. If there are no conflicts, all the staged changes are committed as a new versioned snapshot, and the write operation succeeds. However, if there are conflicts, the write operation fails with a concurrent modification exception rather than corrupting the table as would happen with the write operation on a Parquet table.

-- COMMAND ----------

SELECT * FROM Company

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

UPDATE Company
SET name = name+"_updated"
WHERE companyId > 2 AND companyId <= 5;

-- COMMAND ----------

select * from Company

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

DELETE FROM Company
WHERE companyId = 4 OR companyId = 5;

-- COMMAND ----------

Select * from Company

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Merging into your Delta table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Merge the updates defined below based on type into the company table
-- MAGIC - What advantages does MERGE bring over doing the action in doing update, delete and insert separately?
-- MAGIC - What are the requirements on matching? 
-- MAGIC - What happens if the job fails midway?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 
-- MAGIC ### What advantages does MERGE bring over doing the action in doing update, delete and insert separately?
-- MAGIC 
-- MAGIC It does everything in one transaction.
-- MAGIC 
-- MAGIC ### What are the requirements on matching?
-- MAGIC 
-- MAGIC That the condition specified with the **`ON`** clause is respected or disrespected.
-- MAGIC 
-- MAGIC If it is respected, it will go into **`WHEN MATCHED`** branch.
-- MAGIC 
-- MAGIC If it is disrespected, it will go into **`WHEN NOT MATCHED`** branch.
-- MAGIC 
-- MAGIC ### What happens if the job fails midway?
-- MAGIC 
-- MAGIC All changes are discarded and the table remains unchanged.

-- COMMAND ----------

-- Updates to merge into company table
CREATE OR REPLACE TEMP VIEW updates(name, companyId, income, type) AS VALUES 
  ("Omar", 13, 24.5, "update"),
  ("", 8, 12.3, "delete"),
  ("Blue", 7, 123.5, "insert"),
  ("Diya", 15, 43.2, "update");

-- COMMAND ----------

MERGE INTO Company c
USING updates u
ON c.companyId = u.companyId
WHEN MATCHED AND u.type = "update"
  THEN UPDATE SET *
WHEN MATCHED AND u.type = "delete"
  THEN DELETE
WHEN NOT MATCHED AND u.type = "insert"
  THEN INSERT *

-- COMMAND ----------

SELECT * from Company

-- COMMAND ----------

-- MAGIC %md  
-- MAGIC ### Delete company table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Delete your company table
-- MAGIC - How does the delete statement behave when deleting managed and unmanaged tables? 
-- MAGIC - How many transactions have been triggered?
-- MAGIC - What happens if the job fails midway?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 
-- MAGIC ### How does the delete statement behave when deleting managed and unmanaged tables?
-- MAGIC 
-- MAGIC When deleting a managed table, it deletes it from the Hive metadata
-- MAGIC 
-- MAGIC When deleting an unamanaged table, it deletes it from the storage disk
-- MAGIC 
-- MAGIC ### How many transactions have been triggered?
-- MAGIC 
-- MAGIC One.
-- MAGIC 
-- MAGIC ### What happens if the job fails midway?
-- MAGIC 
-- MAGIC It will not execute or it will be rolled back.

-- COMMAND ----------

DROP TABLE Company

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

-- MAGIC %md
-- MAGIC ### How can you explore the students table(metadata) what are the available commands to do so?
-- MAGIC - DESCRIBE EXTENDED **`{table_name}`**
-- MAGIC - DESCRIBE DETAIL **`{table_name}`**
-- MAGIC 
-- MAGIC ### How many partitions does the table have, have can you change the number of partitions?
-- MAGIC 
-- MAGIC The table is unpartitioned. 
-- MAGIC 
-- MAGIC ### Where is the data physically located?
-- MAGIC 
-- MAGIC In: **`dbfs:/user/hive/warehouse/students`**
-- MAGIC 
-- MAGIC ### What further information can you find in metadata?
-- MAGIC - Date of Creation
-- MAGIC - Format
-- MAGIC - Last modification
-- MAGIC - Is it partitioned by a column?
-- MAGIC - Number of Files
-- MAGIC - Size in bytes
-- MAGIC - Type (Managed/Unmanaged)
-- MAGIC - Location
-- MAGIC - All columns and their data types
-- MAGIC 
-- MAGIC ### Describe how is partitioning handled on the underlying physical storage
-- MAGIC 
-- MAGIC It is split into multiple files based on a specified partition column (such as city/country for example)

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

DESCRIBE HISTORY Students

-- COMMAND ----------

RESTORE TABLE Students TO VERSION AS OF 14


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### OPTIMIZE command
-- MAGIC - What does this command do?
-- MAGIC - How it is usefull?
-- MAGIC - When it should be used?
-- MAGIC - What is the syntax of the command?
-- MAGIC - How often should the command run? 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 
-- MAGIC ### What does this command do?
-- MAGIC 
-- MAGIC It optimizes everything into one single file
-- MAGIC 
-- MAGIC ### When it should be used?
-- MAGIC 
-- MAGIC After finishing work on a database
-- MAGIC 
-- MAGIC ### What is the syntax of the command?
-- MAGIC 
-- MAGIC **`OPTIMIZE {table_name}`**
-- MAGIC 
-- MAGIC ### How often should the command run?
-- MAGIC 
-- MAGIC Once, when you are finished. Further executions won't do anything.

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

-- MAGIC %md
-- MAGIC ### What does this command do?
-- MAGIC 
-- MAGIC Z-Ordering is a technique to colocate related information in the same set of files. This co-locality is automatically used by Delta Lake on Databricks data-skipping algorithms. This behavior dramatically reduces the amount of data that Delta Lake on Databricks needs to read.
-- MAGIC 
-- MAGIC ### How it is useful?
-- MAGIC 
-- MAGIC It reduces the amount of data required to read.
-- MAGIC 
-- MAGIC ### When it should be used?
-- MAGIC 
-- MAGIC After Optimize
-- MAGIC 
-- MAGIC ### What is the syntax of the command?
-- MAGIC 
-- MAGIC **`OPTIMIZE {TABLE_NAME} ZORDER BY {column}`**
-- MAGIC 
-- MAGIC ### How often should the command run?
-- MAGIC 
-- MAGIC Once, at the end of work
-- MAGIC 
-- MAGIC ### On which columns it should be used?
-- MAGIC 
-- MAGIC On the common columns, such as CITY, COUNTRY, ZIPCODE, REGION, etc
-- MAGIC 
-- MAGIC ### How it can be switched to different column?
-- MAGIC 
-- MAGIC By specifying a different column after ZORDER BY

-- COMMAND ----------

-- Run the ZORDER command
OPTIMIZE Students
ZORDER BY id
