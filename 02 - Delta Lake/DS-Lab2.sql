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
-- MAGIC **Your ANSWERS about Delta Lake**
-- MAGIC - **What it is?**  
-- MAGIC Is an open-source project that enables building a data lakehouse on top of existing storage systems
-- MAGIC - **What advantages does it bring?**  
-- MAGIC It optimizes cloud object storage (cheap, durable, highly availble, infinitly scalable)
-- MAGIC - **What does ACID mean? Why do we need it?**  
-- MAGIC ACID - Atomicity,Consistency,Isolation,Durability  
-- MAGIC We need it so that mltiple writers across multiple clusters can simultaneously modify a table partition and see a consistent snapshot view of the table and there will be a serial order for these writes and for readers to continuously see a consistent snapshot view of the table that the Databricks job started with, even when a table is modified during a job.
-- MAGIC - **What it is not?**  
-- MAGIC Proprietary technology  
-- MAGIC Storage format  
-- MAGIC Storage medium  
-- MAGIC Database service or data warehouse  
-- MAGIC - **On top of what format it is built?**  
-- MAGIC  Builds upon standard data formats

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
CREATE TABLE IF NOT EXISTS Company_Daniela
  (name String, companyId Int , income Double)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **ANSWERS**
-- MAGIC - **Is this table managed or unmanaged?**  
-- MAGIC This table is managed because the unmanaged table allways needs to specify a LOCATION(path) when the table is created.  
-- MAGIC Here the table  is managed because Spark manages both the data and the metadata.
-- MAGIC - **Why do we not need to specify format?**  
-- MAGIC Because the default format is delta  
-- MAGIC - **Where is the table physicali stored? What storage and database it use?**  
-- MAGIC Inside the database directory location as data in Parquet files.  

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
-- MAGIC **ANSWER**
-- MAGIC - **What is a transaction?**  
-- MAGIC Is a unit of work that is performed against a database. 
-- MAGIC - **What does it mean commiting a transaction?**  
-- MAGIC It means to make all changes visible to other users (updating a record in a database)
-- MAGIC - **What happens if the job fails midway?**  
-- MAGIC Changes are not commited until a job has succeded, jobs will either fail or succed complitely.

-- COMMAND ----------

-- INSERT 3 records in single transaction
INSERT INTO Company_Daniela
VALUES
  ("Alex",1,253.20),
  ("Edi",2,222.20),
  ("Andrei",3,2233.20);

-- COMMAND ----------

-- INSERT 2 records each in a different transaction
INSERT INTO Company_Daniela VALUES ("Alexx",4, 1034.0);
INSERT INTO Company_Daniela VALUES ("Daniela",5, 234.34);

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
SELECT * FROM Company_Daniela;

-- How would you query it if it were in a different database?
-- SELECT * FROM dabase_name.company
-- How can you get older version of the table?
-- SELECT * FROM table_name VERSION AS OF version_desired


-- COMMAND ----------

-- MAGIC %md
-- MAGIC **ANSWARE**
-- MAGIC - **How does the versioning of delta tables work? What does it use?**  
-- MAGIC Versioning means that you can return to a version of tha table from when it was created till now, that has all the modified states of the table in versions.  
-- MAGIC It is used if you make a mistake and want to go back to a previous version or if you have to do another task on the data before the delet and so on.  
-- MAGIC It use table are stored in the transaction log.
-- MAGIC - **What does happen if someone is reading at the same time you are writing into the table?**  
-- MAGIC Readers continue to see a consistent snapshot view of the table that the Azure Databricks job started with, even when a table is modified during a job.
-- MAGIC - **How are concurent reads handled? What are the limitations?**  

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
-- UPDATE Company_Daniela
-- SET name = "Babi"
-- WHERE name = "Alex"

DESCRIBE HISTORY Company_Daniela

-- COMMAND ----------

-- MAGIC %md
-- MAGIC - **How many transactions has been triggered?**  
-- MAGIC There were triggered two transactions

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
-- DELETE FROM Company_Daniela
-- WHERE companyId <= 2

DESCRIBE HISTORY Company_Daniela

-- COMMAND ----------

-- MAGIC 
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
MERGE INTO company_daniela a
USING updates b
ON a.companyId=b.companyId
WHEN MATCHED AND b.type = "update"
  THEN UPDATE SET *
WHEN MATCHED AND b.type = "delete"
  THEN DELETE
WHEN NOT MATCHED AND b.type = "insert"
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
DROP TABLE Company_Daniela;

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
RESTORE TABLE students TO VERSION AS OF 6

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
OPTIMIZE students
ZORDER BY id

-- COMMAND ----------


