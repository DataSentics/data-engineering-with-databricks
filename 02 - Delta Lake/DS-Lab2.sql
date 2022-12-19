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
-- MAGIC - Delta Lake is a storage layer that runs on top of an existing Data Lake in order to imporve its reliability, security and performance (Data Lakehouse)
-- MAGIC - Delta Lake provides ACID transactions, Scalable Metadata and Time Travel
-- MAGIC - ACID = Atomicity, Consistency, Isolation, Durability
-- MAGIC     - It ensures data quality and integrity
-- MAGIC - Delta Lake is not a Data Lake or other type of database
-- MAGIC - It mainly utilizes/improves the Parquet file format

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
create or replace table filip_employees (name string, companyId int, income double);
describe extended filip_employees;
-- table is managed
-- delta is the default format
-- it is stored in the default location: dbfs:/user/hive/warehouse/employees
-- it is stored in the database: default
select * from filip_employees;

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
insert into filip_employees values
('John', 1, 253),
('Mike', 1, 300),
('Eugene', 2, 400);
-- a transaction is one or multiple operations on a database performed as a single unit of work
-- commiting a transaction means saving the modified data permanently
select * from filip_employees;

-- COMMAND ----------

-- INSERT 2 records each in a different transaction
insert into filip_employees values ('Rick', 3, 500);
insert into filip_employees values ('Morty', 3, 350);
-- if the job fails midway the transaction is canceled

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
select * from filip_employees;
-- select * from database.filip_employees
select * from filip_employees version as of 2;
-- Delta Lake keeps track of all the transactions performed on a table/ delta files are stored for each modification
-- Due to ACID-Isolation it is perfectly ok if someone is reading and writing at the same time using the same table
-- Delta Lake supports concurrent reads 

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
update filip_employees
set income = income + 200
where companyId = 1;

describe history filip_employees;
-- one transaction
-- 
-- 
-- a new version has been created

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
delete from filip_employees
where companyId = 1;

describe history filip_employees;

-- one transaction 
--
-- 
-- a new version has been created

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
merge into filip_employees fe
using updates u
on fe.name = u.name
when not matched then insert *;

select * from filip_employees;

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
drop table filip_employees;
-- 
-- one transaction
-- if the job fails the transactions is reversed

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Create students table with history for the purposes of the next exercises**

-- COMMAND ----------

CREATE or replace TABLE f_students
  (id INT, name STRING, value DOUBLE);
  
INSERT INTO f_students VALUES (1, "Yve", 1.0);
INSERT INTO f_students VALUES (2, "Omar", 2.5);
INSERT INTO f_students VALUES (3, "Elia", 3.3);

INSERT INTO f_students
VALUES 
  (4, "Ted", 4.7),
  (5, "Tiffany", 5.5),
  (6, "Vini", 6.3);
  
UPDATE f_students 
SET value = value + 1
WHERE name LIKE "T%";

DELETE FROM f_students 
WHERE value > 6;

CREATE OR REPLACE TEMP VIEW f_updates(id, name, value, type) AS VALUES
  (2, "Omar", 15.2, "update"),
  (3, "", null, "delete"),
  (7, "Blue", 7.7, "insert"),
  (11, "Diya", 8.8, "update");
  
MERGE INTO f_students b
USING f_updates u
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
DESCRIBE EXTENDED f_students;
-- describe extended, describe detail, describe history, dbutils.fs.ls()
-- no partitions
-- dbfs:/user/hive/warehouse/students
-- database, owner, provider, managed or external
-- 

-- COMMAND ----------

-- Write the second option to explore the students table in depth
DESCRIBE DETAIL f_students;

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
describe history f_students;
-- restore f_students to version as of 1;
-- history is retaine dthrough delta files
-- you can to up to the creation of the table
-- vacuum
-- 

-- COMMAND ----------

-- Roll back to different vesrion in the history of stundets table
restore f_students to version as of 1;

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
optimize f_students;

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
optimize f_students
zorder by name;
