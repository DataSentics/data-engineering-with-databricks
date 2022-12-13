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
# MAGIC **Your answers about DWH**
# MAGIC 
# MAGIC - DWH is a traditional approach on working with data. It follows an ETL-like approach, meaning data is first collected, then transformed to specific requirements and then loaded into a warehouse
# MAGIC - The main use case is analytics
# MAGIC 
# MAGIC - Advantages
# MAGIC   - All the changes to data are tracked, it provides and integrated system for organizations and their data, provides realiable and quality data
# MAGIC 
# MAGIC - Disadvantages
# MAGIC   - No support for unrelational data, primarily based on on-premise architecture making it costly to maintain
# MAGIC 
# MAGIC - Dimensional modelling which uses the concepts of facts and dimensions, usually found in OLAP systems.

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
# MAGIC **Your answers about Data Lake**
# MAGIC 
# MAGIC - Centralized repository that accepts all kinds of data, structured, unstructured and semi-structured which is stored in its original state before being transformed for specific use-cases.
# MAGIC - Big Data applications
# MAGIC 
# MAGIC - Advantages
# MAGIC   - Data can be considered as a single source of truth 
# MAGIC   - Stored data can be multi-structured and from diverse sources 
# MAGIC   - Broad use-cases since every data practitioners can acces raw data and tailor it to their specific needs
# MAGIC - Disadvantages
# MAGIC   - Since practitioners have access to data in its raw state, each user might choose a different approach and come to a different result when working with it
# MAGIC   - Time lost since everyone needs to do their transforming of the data
# MAGIC   - No support for data governance
# MAGIC 
# MAGIC - Isn't as normalized and is driven by partitions
# MAGIC   

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
# MAGIC **Your answers about Data LakeHouse**
# MAGIC 
# MAGIC - A unified platform for almost every use case for working with data
# MAGIC 
# MAGIC - Since it provides a replacement for the dependancies between data warehouses and data lakes it has a very broad area of aplication, but it is mainly used for ml and data science applications on cloud
# MAGIC 
# MAGIC - Advantages
# MAGIC   - Makes working on data easily colaborative between data practitioners
# MAGIC   - Open-source standards and formats
# MAGIC   - Easily scalable
# MAGIC 
# MAGIC - Disadvantages
# MAGIC   - Can be overkill for some use cases
# MAGIC   
# MAGIC - Dependant on the specific use case and tools used
# MAGIC 
# MAGIC - Delta format which is used because it provides acid transcations, faster data processing and governance to existing data formats (e.g parquet) and can store any type of data
# MAGIC 
# MAGIC - The Databricks Lakehouse takes the best from both worlds (data warehouses, data lakes) and combines them into a platform to enable any type of work revolving around data. It also facilitates keeping data in cloud storage in open source data fromats.

# COMMAND ----------

# MAGIC %md
# MAGIC ### What are some of the problems organizations face when working with data?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers about problems with data**
# MAGIC 
# MAGIC - 

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
