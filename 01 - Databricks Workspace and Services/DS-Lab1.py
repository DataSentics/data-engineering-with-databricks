# Databricks notebook source
# MAGIC %md
# MAGIC ### Can you understand DWH?
# MAGIC  - What is it?
# MAGIC  - What is the main use case?
# MAGIC  - What are some of the advantages?
# MAGIC  - What are some of the disadvantages?
# MAGIC  - What data modeling approach is used?
# MAGIC  [Some resources can be found here](https://www.notion.so/datasentics/Data-Warehousing-DWH-959631309517455fbd4f3259f8402084)

# COMMAND ----------

# MAGIC %md 
# MAGIC - Data warehousing is storing data in a data warehouse (basically a storage of structured data)
# MAGIC - Main use case is for storing data coming from relational databases
# MAGIC - Advantages:
# MAGIC   - Changes are tracked, so one can check the changes over time
# MAGIC   - Data is never over-written
# MAGIC - Disadvantages:
# MAGIC   - Lack of unstructured data support
# MAGIC   - Usually built on-premise - meaning high initial and maintenance cost, as well as a difficulty to migrate to more updated technologies such as the cloud
# MAGIC   - Difficulty to provide data for multiple case uses due to the nature of the ETL process
# MAGIC - The data modeling approach is dimensional modeling, through the star schema or OLAP (online analytical processing) cubes. Basically fact and dimension based.

# COMMAND ----------

# MAGIC %md
# MAGIC ### Can you understand Data Lake?
# MAGIC  - What is it?
# MAGIC  - What is the main use case?
# MAGIC  - What are some of the advantages?
# MAGIC  - What are some of the disadvantages?
# MAGIC  - What data modeling approach is used?
# MAGIC [Some resources can be found here](https://www.notion.so/datasentics/Data-Lake-18fa4322a4cd403c9642274b83035f47)

# COMMAND ----------

# MAGIC %md
# MAGIC - A data lake is a storage that can hold any type of data, structured, semi-structured or unstructured.
# MAGIC - Main use case is for storing and processing "big data" specific data, such as images, videos, audio, but can also be used for classic structured data.
# MAGIC - Advantages:
# MAGIC   - Posibility to store and process any kind of data.
# MAGIC   - The raw data can be considered as a single source of truth.
# MAGIC   - Availibility to whole company, and ease of access.
# MAGIC   - The possibility to be used by data scientists and data analysts as well as data engineers.
# MAGIC   - Simple billing process.
# MAGIC - Disadvantages:
# MAGIC   - While the raw data is the single source of truth, the data manipulation results depend on how the users actually manipulate it. This can lead to incorrect results.
# MAGIC   - The lack of governance can lead to a storage mess.
# MAGIC - Rather than using the normalization principles, which are very efficient in a data warehouse, the data lakes are largely based on gathering the facts and dimensions together, and partitioning the data for reading only the specific information needed instead of having to go through all the data each time.

# COMMAND ----------

# MAGIC %md
# MAGIC ### Can you understand Data LakeHouse?
# MAGIC  - What is it?
# MAGIC  - What is the main use case?
# MAGIC  - What are some of the advantages?
# MAGIC  - What are some of the disadvantages?
# MAGIC  - What data modeling approach is used?
# MAGIC  - What data format is usually used and why? 
# MAGIC  - How does Databricks use DataLakeHouse?
# MAGIC Databricks documentation and videos provide a lot of resources about this

# COMMAND ----------

# MAGIC %md
# MAGIC - A data lakehouse is basically a platform that brings together the power of computing with data storage.
# MAGIC - Main use is to actually compute over the data through a unified platform.
# MAGIC - Advantages:
# MAGIC   - Unified platform that combines all the elements that a data engineer, a data analyst and a data scientist would use (git/repository integration, data lake storage, computing, the use of Delta Lake).
# MAGIC   - Delta Lake usage, which brings ACID transactions, indexing (for faster computing), and governance (unity catalog).
# MAGIC - Disadvantages:
# MAGIC   - Depending on the type of work needed, a data lakehouse could be more than needed.
# MAGIC - It can use both the classic data modeling approach used by data warehouses, and the data model used by data lakes, depending on the specific data types that need to be worked on.
# MAGIC - Best format to use would be the Delta format, as it brings the added layers of ACID transactions and indexing over parquet files.
# MAGIC - It brings all the functions together under the big umbrella that is the Databricks platform. The ability to access the data stored in a data lake, combined with the ability to do the data manipulations needed, posibility of using git repositories and everything under the Delta Lake element brings the best of all worlds together.

# COMMAND ----------

# MAGIC %md
# MAGIC ### What are some of the problems organizations face when working with data?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers about problems with data**

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
