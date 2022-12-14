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
# MAGIC - Usualy revolve around their architecture, meaning that organizations' stacks are usually siloed (separated from each other) which in turn increases complexity around working with data, underlying technologies aren't usually harmonized, integration is difficult and productivity is extremly hindered when data teams are isolated from eachother. These data ecosystems are hard to manage and have a high maintenance cost.

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
# MAGIC 
# MAGIC - Control Plane and Data Plane
# MAGIC 
# MAGIC - Control Plane:
# MAGIC   - Web App
# MAGIC   - Notebooks
# MAGIC   - Job scheduling
# MAGIC   _ Cluster management
# MAGIC   
# MAGIC - Data Plane
# MAGIC   - Compute resources
# MAGIC   - Connections to data sources
# MAGIC   - DBFS
# MAGIC 
# MAGIC - Differences
# MAGIC   - The control plance represents the backend services for managing users, datasets and computing resources whereas the data plane is where all these resources reside
# MAGIC 
# MAGIC - Control Plane managed by DBX
# MAGIC - Data plane managed by customer

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
# MAGIC 
# MAGIC - All-purpose cluster and job clusters
# MAGIC 
# MAGIC - Differences:
# MAGIC   - All-purpose clusters are used to analyze data colaboratively using notebooks and job clusters run automated tasks
# MAGIC   
# MAGIC - In the performance section of the compute menu
# MAGIC 
# MAGIC - You need to restart the cluster
# MAGIC 
# MAGIC - I tried, i'm not lying
# MAGIC 
# MAGIC - Restart: terminates the cluster and turns it back on
# MAGIC - Terminate: is stops the instanced cluster
# MAGIC - Delete: deletes the cluster along with its configs

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
# MAGIC 
# MAGIC - DataScience&Engineering: it serves the purpose of an environment for collaboration among data scientists, data engineers, and data analysts. Basically a general purpose environment
# MAGIC 
# MAGIC - SQL Tab is primarily used for SQL queries visualizations, dashboard etc.
# MAGIC 
# MAGIC - Machine Learning tab is a variant of the DataScience&Engineering env, specialized on experiment tracking, model training, feature development and management.
# MAGIC 
# MAGIC - Git integration tab in user settings
# MAGIC 
# MAGIC - user settings -> notebook settings
# MAGIC 
# MAGIC - admin console -> users

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
# MAGIC 
# MAGIC - ctrl + enter or run icon with options (above, below etc)
# MAGIC 
# MAGIC - top right part of notebook, clear state is in the run tab under the notebook_name, this means it resets the state of the notebook
# MAGIC 
# MAGIC - use the magic symbol % and the language of prefference
# MAGIC 
# MAGIC - %fs to acces the file system, %md for markdown cells, %run to run different notebooks within notebooks, the language selection commands etc.
# MAGIC 
# MAGIC - not entirely sure what databricks special functions are, maybe we could discuss it sometime
