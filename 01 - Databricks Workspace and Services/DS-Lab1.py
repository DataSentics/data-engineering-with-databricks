# Databricks notebook source
# MAGIC %md
# MAGIC ### Can you understand DWH?
# MAGIC  0. What is it?
# MAGIC  0. What is the main use case?
# MAGIC  0. What are some of the advantages?
# MAGIC  0. What are some of the disadvantages?
# MAGIC  0. What data modeling approach is used?
# MAGIC  [Some resources can be found here](https://www.notion.so/datasentics/Data-Warehousing-DWH-959631309517455fbd4f3259f8402084)

# COMMAND ----------

# MAGIC %md 
# MAGIC **Your answers about DWH**
# MAGIC 
# MAGIC 0. it is a system used for managing data
# MAGIC 0. mainly used for BI/supporting decision-making, analytics; not DS or ML
# MAGIC 0. 
# MAGIC - fast (for the usual volume of data),
# MAGIC - reliable (been around and researhced for decades), 
# MAGIC - ACID (ensures data/transactions integrity); 
# MAGIC - ensures data consistency; can store data from multiple sources
# MAGIC - uses SQL for querying, which is known by many people
# MAGIC 3.
# MAGIC - does not work for un-structured or semi-structured data; 
# MAGIC - it is built for a specific use-case, and difficult to adapt; 
# MAGIC - difficult to scale in terms of of data volume;
# MAGIC 4. Star schema, for structured data; data is modeled using the dim/facts approach, with tables, primary/foreign keys ensuring the DB integrity

# COMMAND ----------

# MAGIC %md
# MAGIC ### Can you understand Data Lake?
# MAGIC 0. What is it?
# MAGIC 0. What is the main use case?
# MAGIC 0. What are some of the advantages?
# MAGIC 0. What are some of the disadvantages?
# MAGIC 0. What data modeling approach is used?
# MAGIC [Some resources can be found here](https://www.notion.so/datasentics/Data-Lake-18fa4322a4cd403c9642274b83035f47)

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers about Data Lake**
# MAGIC 
# MAGIC 0. Still a syatem used for managing data, but unlike DWH, supports semi- or un-structured data; developed with the limitations of the DWH in mind
# MAGIC 1. ML/DS; but also BI
# MAGIC 2. Compared to DWH:
# MAGIC - supports any data format (structured, semi-, un, binary/incliding video/pictures, or any file format like json, cav, parquet)
# MAGIC - easily scaleable, especially if stored in cloud; low cost storage
# MAGIC - more flexible in terms of use-cases
# MAGIC - open source, unlike DWH
# MAGIC - all company data in one place
# MAGIC 3. can become a data swamp, if not maintained; data quality will degrade over time; complex structure
# MAGIC 4. flat files, partitioned using logic; schema-on-read approach to data structure

# COMMAND ----------

# MAGIC %md
# MAGIC ### Can you understand Data LakeHouse?
# MAGIC 0. What is it?
# MAGIC 0. What is the main use case?
# MAGIC 0. What are some of the advantages?
# MAGIC 0. What are some of the disadvantages?
# MAGIC 0. What data modeling approach is used?
# MAGIC 0. What data format is usually used and why? 
# MAGIC 0. How does Databricks use DataLakeHouse?
# MAGIC Databricks documentation and videos provide a lot of resources about this

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers about Data LakeHouse**
# MAGIC 0. Another data management system, addressing the limitations of Data Lake, by combining a Data Lake with the advantages of a Data Warehouse
# MAGIC 1. can be ML, DS, BI
# MAGIC 2. All advantages of a Data lake, plus:
# MAGIC - Data structure from DWH (schema support)
# MAGIC - 
# MAGIC 3. Complex to build/migrate from data lake; complex to maintain
# MAGIC 4. Data-engineering...? :); flexible, any approach can be used
# MAGIC 5. Open source, big data-specific formats, like parquet, for faster read-write, and to avoid lock-in to some proprietary formats; also to reduce disk usage (csv or json do not fit here)
# MAGIC 6. Dbx itself is a Data lakehouse + spark (as data engine) + Delta lake (as storage layer)

# COMMAND ----------

# MAGIC %md
# MAGIC ### What are some of the problems organizations face when working with data?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers about problems with data**
# MAGIC data silos, department/use-case isolation, multiple sources of truth, data volume/storage, access/governance, etc etc

# COMMAND ----------

# MAGIC %md
# MAGIC ### What are the 2 main parts of Databricks(DBX) architecture
# MAGIC - What are the components and name of the 1 parts
# MAGIC - What are the components and name of the 2 part
# MAGIC - What is the difference between the 2 parts
# MAGIC - Who manages which part of the architecture

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers about DBX architecture**
# MAGIC 1. Control Plane: the actual web app, notebooks, jobs, clutser management, account management
# MAGIC 2. Data Plane: where data gets processed and read/writen: storage, computing resources
# MAGIC 3. Control Plane is directing the Data plane: access, job triggers, read/write triggers...
# MAGIC 4. Control Plane: databricks user; Data Plane: the cloud

# COMMAND ----------

# MAGIC %md
# MAGIC ### Clusters
# MAGIC - What type of clusters do we have?
# MAGIC - What are the differences between them?
# MAGIC - How do you specify a runtime in cluster?
# MAGIC - What you need to do when configuration of cluster has changed?
# MAGIC - Try to set up a cluster, play with the configuration
# MAGIC - What is the difference between restarting, terminating and deleting the cluster?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers about clusters**
# MAGIC 1. All purpose, job
# MAGIC 2. Job is for runnign shceduled jobs; cluster starts, runs job, then shuts down; cannot be restarted; AP is for collaboration/development using notebooks
# MAGIC 3. When creating the cluster, Runtime Version selection is available
# MAGIC 4. Restart Cluster
# MAGIC 5. Done, although more understanding of the options are needed
# MAGIC 6. - Terminate: stops the cluster, but saves the config, and can be restarted (you still see the cluster under 'Compute')
# MAGIC - Restart = terminate + start (with the same config)
# MAGIC - Delete = Terminate + config is not saved, cluster is gone forever

# COMMAND ----------

# MAGIC %md 
# MAGIC ### Databricks UI
# MAGIC - What is the purpose of DataScience&Engineering?
# MAGIC - What is the purpose of SQL Tab?
# MAGIC - What is the purpose of Machine Learning tab
# MAGIC - Where can you insert the github API token
# MAGIC - Where can you change the number of spaces for tab?
# MAGIC - Where can you manage access to databricks for other people?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers about Databricks UI**
# MAGIC 1. Explore data, build and run notebooks & applications
# MAGIC 2. Run SQL queries on data
# MAGIC 3. Run, train and track  ML models
# MAGIC 4. Under User/User Settings/Git Integration
# MAGIC 5. Under User/User Settings/Notebooks Settings, there is a tickbox for 'default indentation'
# MAGIC 6. Probably Not available to my account, but: docs speak about an admin console; or the Share Button, if this is just about sharing a notebooks. Share button is disabled for me, not sure why :)

# COMMAND ----------

# MAGIC %md
# MAGIC ### Notebook basics
# MAGIC - How to run a cell, all cells above/below?
# MAGIC - How to attach cluster, clear a state of notebook, what does clearing a state means, when you need to do it?
# MAGIC - How to create a cells in different language?
# MAGIC - What are some of the magic commands, how can you run a different notebook from within a notebook?
# MAGIC - What are some of the special functions databricks makes available to you? 

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers about notebooks**
# MAGIC 1. Each code cell has the "Run" triangle in the upper-right corner; click the Down-arrow next to that sign offers choice: Run cell, all above, all below
# MAGIC 2. Upper right corner of the notebook UI, choose a cluster and click attach
# MAGIC - clear state: remove all the notebook-scoped vatiables from memory; can be achieved via Dettach(&Reattach) cluster, terminate or restart the cluster (some people might curse you for doing that, though)
# MAGIC 3. use magic :); %python, %sql, %md
# MAGIC 4. %fs for file system; %run (relative path) for running other notebooks
# MAGIC 5. dbutils, see below

# COMMAND ----------

display(dbutils)
