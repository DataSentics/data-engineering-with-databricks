# Databricks notebook source
# MAGIC %md
# MAGIC ### Can you understand DWH?
# MAGIC  - What is it?
# MAGIC   A data warehouse is a relational data management system that is designed to support BI activities
# MAGIC  - What is the main use case?
# MAGIC  It is used to perform queries and analysis
# MAGIC  - What are some of the advantages?
# MAGIC  Can contain large amounts of data, perform accurate analysis, has ELT solutions, subject-oriented and nonvolatile
# MAGIC  - What are some of the disadvantages?
# MAGIC  When performing bigger jobs it is hard to scale, can store only structured data (e.g. tables)
# MAGIC  - What data modeling approach is used?
# MAGIC  Architecture for Data Warehousing and Business Intelligence.
# MAGIC  [Some resources can be found here](https://www.notion.so/datasentics/Data-Warehousing-DWH-959631309517455fbd4f3259f8402084)

# COMMAND ----------

# MAGIC %md 
# MAGIC **Your answers about DWH**

# COMMAND ----------

# MAGIC %md
# MAGIC ### Can you understand Data Lake?
# MAGIC  - What is it?
# MAGIC   A centralized repository designed to store, process, and secure large amounts of structured, semistructured, and unstructured data. It can store data in any type of format and process any variety of it.
# MAGIC  - What is the main use case?
# MAGIC  It is used mainly for data science and machine learning
# MAGIC  - What are some of the advantages? 
# MAGIC  Store any type of data, inexpensive storage
# MAGIC  - What are some of the disadvantages?
# MAGIC   hard to maintain it clean (can become a data swapm), poor bi performance
# MAGIC  - What data modeling approach is used?
# MAGIC   Data Vaults and Star Schemas
# MAGIC [Some resources can be found here](https://www.notion.so/datasentics/Data-Lake-18fa4322a4cd403c9642274b83035f47)

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers about Data Lake**

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
# MAGIC What are the components and name of tge 1 parts : 
# MAGIC Control Plane: Web application, Jobs, Repos, Cluster Management
# MAGIC What are the components and name of the 2 part :
# MAGIC Data Plane: Databricks File System, Data Sources
# MAGIC What is the difference between the 2 parts :
# MAGIC  Control Plane is the environment you are working on (web application, jobs, repos)and the Data Plane is where all the data is proccessed
# MAGIC  Who manages which part of the architecture : 
# MAGIC  Control Plane by customers accounts, datasets, clusters and Data Plane by Cluster management (workloads)

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
# MAGIC What type of clusters do we have? 
# MAGIC There are two clusters: All-Purpose Cluster and Job Cluster
# MAGIC 
# MAGIC What are the differences between them?
# MAGIC All-Purpose cluster is used to analyze data collaboratively using notebooks by one or more people and the Job cluster is  used to schedule jobs at a given time (the cluster is terminated when the job is done)
# MAGIC 
# MAGIC When you create a cluster or edit it you can choose manually the version your cluster will run  
# MAGIC  
# MAGIC  What you need to do when configuration of cluster has changed?
# MAGIC  Detach and Re-attach
# MAGIC  
# MAGIC What is the difference between restarting, terminating and deleting the cluster?** 
# MAGIC Restart - used to manually restart the cluster. usefull when you need to clear the cache on the cluster.
# MAGIC Terminate - stop our cluster but the cluster configuration is maintained and can be reused using restart to set a new set of cloud resources.
# MAGIC Delete - stop and remove the cluster configuration.

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
# MAGIC 
# MAGIC How to run a cell, all cells above/below?
# MAGIC You click on the right-up corner arrow and you have all 3 commands 
# MAGIC 
# MAGIC How to attach cluster, clear a state of notebook, what does clearing a state means, when you need to do it?** you can attach a cluster when you want to run a command. You need to clear the state because it is saveing memory in the cache and it takes resources and money
# MAGIC 
# MAGIC How to create a cells in different language? 
# MAGIC magic command or set the default language in the right-up corner
# MAGIC 
# MAGIC What are some of the magic commands, how can you run a different notebook from within a notebook?
# MAGIC %md, %sql, %python, %fl.
# MAGIC 
# MAGIC What are some of the special functions databricks makes available to you?
# MAGIC any(expr), approx_count_distinct(expr[,relativeSD])
