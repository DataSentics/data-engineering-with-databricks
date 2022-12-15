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
-- MAGIC 1. it is an open-source storage framework, which allows building Data Lakehouses (Lake+Warehouse benefits) on top of Data lakes, and integrates with an data processing engine (like Spark)
-- MAGIC 2. ACID, transaction log/time-travel ability, scale-ability, open source, schema-enforcing to Data Lake
-- MAGIC 3. Atomicity, Consistency, isolation, Durability: with Big Data, reads-writes happen with high freq, so to protect against data corruption, a transactions either fails completely or is succesfull, therefore reflected or not in the data, cannot fail mid-way through; all transactions must be consistent with the data structure/schema; transactions are processed one by one, independent of each other; and once a transaction is through, it is permanent (time-travel being exception)
-- MAGIC 4. Delta Lake is not a storage resource, not a procssing engine, not a file format
-- MAGIC 5. Parquet

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

create or replace table Company (name string, companyId int, income double)
-- table exists; should have used create table if not exists, to avoid the error message

-- COMMAND ----------

-- describe Company;
describe table extended Company;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Answers**
-- MAGIC - table is managed (created in the default location)
-- MAGIC - delta is default, so no need to specify the format
-- MAGIC - it is physically stored in the "dbfs:/user/hive/warehouse/company"; we can see that with `describe detail` or `describe extended`
-- MAGIC - DBx default storage, database `default` 
-- MAGIC - using `create table if not exists` to avoid overwrite, but also to ensure no error

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Insert into the table
-- MAGIC 1. Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC 2. What is a transaction? 
-- MAGIC 3. What does it mean commiting a transaction? 
-- MAGIC 4. Insert into the table 3 records in one transaction, values of the records you can make up
-- MAGIC 5. Insert into the table 2 records each one in a single transaction, values of the records you can make up
-- MAGIC 6. What happens if the job fails midway?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Answers**
-- MAGIC 
-- MAGIC 2. Any change done to a table (add/remove/update recs, schema change, table creation/deletion)
-- MAGIC 
-- MAGIC 3. changes are pushed into the table, and become visible when table is queried
-- MAGIC 4. 
-- MAGIC 5. 
-- MAGIC 6. Nothing. the transaction is not reflected in the table, data is not corrupted or anything

-- COMMAND ----------

insert into Company values
('John', 1, 123), ('Mark', 1, 145), ('Superman', 2, 999);

-- COMMAND ----------

-- INSERT 2 records each in a different transaction
insert into Company values ('Zod', 2, 666);
insert into Company values ('Zed', 3, 664);
insert into Company values ('Zid', 2, 665);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Querying a Delta table
-- MAGIC - Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC - Query your delta table customers
-- MAGIC - How would you query it if it were in a different database?
-- MAGIC --<i>dbname.tabname.colname<i>
-- MAGIC - How can you get older version of the table?
-- MAGIC --<i>create or replace temporary view v_name as SELECT * from company VERSION as of vers_number<i>
-- MAGIC - How does the versioning of delta tables work? What does it use?
-- MAGIC --<i>transactions<i>; for each transaction, a new version is being created
-- MAGIC - What does happen if someone is reading at the same time you are writing into the table?
-- MAGIC --<i>can't be exactly the same time; their query will either include or not my new transactions, depending on whether they are executed or not at the time of the query<i>
-- MAGIC - How are concurent reads handled? What are the limitations?
-- MAGIC ----<i>one by one, limited by the infrastructure...(?)<i>

-- COMMAND ----------

select * from company

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Update your table
-- MAGIC 0. Try to write the query without consulting documentation, SQL syntax is important for certification
-- MAGIC 0. Update your table customers, change some names of the companies you inserted before
-- MAGIC 0. How many transactions has been triggered?
-- MAGIC 0. How is concurency when updating and reading handled?
-- MAGIC 0. After what time can you see the updated records in the table?
-- MAGIC 0. What happens if the job fails midway?
-- MAGIC 0. How does the versioning work? Has a new version been created or the existing one updated?

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Answers**
-- MAGIC 
-- MAGIC 2. 1 transaction (version) for 3 updated records ?
-- MAGIC 3. reading the data, updating, writing
-- MAGIC 4. Instantly
-- MAGIC 5. Nothing, the transaction is not reflected in the table
-- MAGIC 6. if a transaction is succsesful, then a new version is created and the transaction is refelcted in the log; a new version only reflects the changes, it is not a new copy of the whole data
-- MAGIC - it created a new version

-- COMMAND ----------

-- Update your table here

UPDATE company
SET companyId = 669
WHERE income between 600 and 665;
DESCRIBE HISTORY company;

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

-- MAGIC %md
-- MAGIC 
-- MAGIC **Answers**
-- MAGIC 
-- MAGIC 3. One transaction for each DELETE command, regardless of how many records are deleted on each command;
-- MAGIC 4. Transaction by transaction: 2 records are deleted at the same time, commited, then moves to the next transaction, which uses the output of the previous transaction as input
-- MAGIC 5. Instantly
-- MAGIC 6. One new version is created for each transaction

-- COMMAND ----------

-- Delete your table here
DELETE FROM company
WHERE companyID = 1;
delete FROM company 
WHERE name = 'Zod';

SELECT* from company;

-- COMMAND ----------

DESCRIBE HISTORY company;

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
-- MAGIC **Answers**
-- MAGIC 
-- MAGIC 3. `MERGE` can do updates, deletes, inserts in a single transaction, thus one read-write (not several)
-- MAGIC 4. the condition specified at `ON` to be true, then we have the possibility to branch out on MATCHED and NOT MATCHED, with optional additional conditions
-- MAGIC 5. None of the changes are performed (the whole transaction fails)

-- COMMAND ----------

-- Updates to merge into company table
CREATE OR REPLACE TEMP VIEW updates(name, companyId, income, type) AS VALUES 
  ("Omar", 13, 24.5, "update"),
  ("", 8, 12.3, "delete"),
  ("Blue", 7, 123.5, "insert"),
  ("Diya", 15, 43.2, "update");

-- COMMAND ----------

-- Merge the above updates into company table here
MERGE into company as c
using updates as u
on c.name = u.name
when MATCHED and u.type = 'update'
  THEN UPDATE SET *
when MATCHED and u.type = 'delete'
  then DELETE
when not matched and u.type = 'insert'
  then insert *;

SELECT * from company;

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
-- MAGIC **Answers**
-- MAGIC 
-- MAGIC 3. Managed tables: deletes data and metadata; for un-managed tables: only metadata and the hive connection is removed; the data stays in place
-- MAGIC 4. Not sure :). `DESCRIBE HOSTORY` resulted in an error; I guess 1 transaction. TBC
-- MAGIC 5. if job fails midway, the table stays in place, no new changes, no new version

-- COMMAND ----------

-- Delete your table here
DROP table Company;

-- COMMAND ----------

-- describe history company;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Create students table with history for the purposes of the next exercises**

-- COMMAND ----------

CREATE or REPLACE TABLE students 
  (id INT, name STRING, value DOUBLE) PARTITIONED BY (id);
  
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
-- MAGIC - How many partitions does the table how, have can you change the number of partitions?
-- MAGIC - Where is the data physically located?
-- MAGIC - What further information can you find in metadata?
-- MAGIC - Describe how is partitioning handled on the underlying physical storage

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 
-- MAGIC **Answers**
-- MAGIC 
-- MAGIC 2. `DESCRIBE`, `EXTENDED` `DETAIL`
-- MAGIC 3. The table is not partitioned, so I guess 1 partition; No Idea how we can change that (?????????????)
-- MAGIC 4. According to `describe detail`: "dbfs:/user/hive/warehouse/students"
-- MAGIC 5. schema details, database name, number of parquet files (and their location and delta log if applicable), table format, managed or not
-- MAGIC 6. A folder is created for each value of the partition variable

-- COMMAND ----------

-- Write the first option to explore the students table in depth
DESCRIBE EXTENDED students

-- COMMAND ----------

-- Write the second option to explore the students table in depth
DESCRIBE DETAIL students

-- COMMAND ----------

DESCRIBE HISTORY students

-- COMMAND ----------

-- MAGIC %python
-- MAGIC 
-- MAGIC display(dbutils.fs.ls('dbfs:/user/hive/warehouse/students/id=1/'))
-- MAGIC display(dbutils.fs.ls('dbfs:/user/hive/warehouse/students/'))

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

-- MAGIC %md
-- MAGIC 
-- MAGIC **Answeers**
-- MAGIC 
-- MAGIC 1. `DESCRIBE HISTORY`
-- MAGIC 3. Per transaction
-- MAGIC 4. Until it has been vacuumed, or table Droped and recreated; `CREATE OR REPLACE` does not reset history
-- MAGIC 5. `VACUUM` or `DROP TABLE`
-- MAGIC 6. `VACUUM` with `RETAIN x HOURS`

-- COMMAND ----------

-- Run the command to see history of students table
DESCRIBE HISTORY students

-- COMMAND ----------

-- Roll back to different vesrion in the history of students table

RESTORE TABLE students to VERsion AS OF 5

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
OPTIMIZE students;

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
-- MAGIC 
-- MAGIC **Answers**
-- MAGIC 
-- MAGIC 1. creates some metadata on the multiple files, to make data read faster, because spark will know which ranges of each ZORDER variable can be found in each file
-- MAGIC 2. Faster data reads, when reading is based on the ZORDER variable
-- MAGIC 3. To be used when we expect a lot of reads to be based on that variable (not clear about the relationship with PARTITION ???????????)
-- MAGIC 5. This is an expensive operation, so use carefully, and not during peak times; it rewrites the data
-- MAGIC 6. Columns whih high cardinality
-- MAGIC 7. Run the command again

-- COMMAND ----------

-- Run the ZORDER command
optimize students
zorder by name

-- COMMAND ----------

DROp TABLE Students
