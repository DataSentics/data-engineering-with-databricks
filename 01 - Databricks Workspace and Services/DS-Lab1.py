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
# MAGIC  - **What is it:** A data warehouse is a relational data management system that is designed to support BI activities
# MAGIC  
# MAGIC  - **What is the main use case:** It is used to perform queries and analysis
# MAGIC  
# MAGIC  - **What are some of the advantages:** Can contain large amounts of data, perform accurate analysis, has ELT solutions, subject-oriented and nonvolatile
# MAGIC  
# MAGIC  - **What are some of the disadvantages:** When performing bigger jobs it is hard to scale, can store only structured data (e.g. tables)
# MAGIC  
# MAGIC  - **What data modeling approach is used:**  Architecture for Data Warehousing and Business Intelligence.

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
# MAGIC  - **What is it:** A centralized repository designed to store, process, and secure large amounts of structured, semistructured, and unstructured data. It can store data in any type of format and process any variety of it.
# MAGIC  
# MAGIC  - **What is the main use case:** It is used mainly for data science and machine learning
# MAGIC  
# MAGIC  - **What are some of the advantages:** Store any type of data, inexpensive storage
# MAGIC  
# MAGIC  - **What are some of the disadvantages:** hard to maintain it clean (can become a data swapm), poor bi performance
# MAGIC  
# MAGIC  - **What data modeling approach is used:** Data Vaults and Star Schemas

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
# MAGIC - **What are the components and name of the 1 parts** Control Plane: Web application, Jobs, Repos, Cluster Management
# MAGIC - **What are the components and name of the 2 part** Data Plane: Databricks File System, Data Sources
# MAGIC - **What is the difference between the 2 parts** Control Plane is the environment you are working on (web application, jobs, repos)and the Data Plane is where all the data is proccessed
# MAGIC - **Who manages which part of the architecture** Control Plane by customers accounts, datasets, clusters and Data Plane by Cluster management (workloads)

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
# MAGIC - **What type of clusters do we have?** There are two clusters: All-Purpose Cluster and Job Cluster
# MAGIC 
# MAGIC - **What are the differences between them?** **All-Purpose cluster** is used to analyze data collaboratively using notebooks by one or more people and the **Job cluster** is  used to schedule jobs at a given time (the cluster is terminated when the job is done)
# MAGIC 
# MAGIC - **How do you specify a runtime in cluster?** When you create a cluster or edit it you can choose manually the version your cluster will run  
# MAGIC 
# MAGIC - **What you need to do when configuration of cluster has changed?** Detach and Re-attache
# MAGIC 
# MAGIC - **What is the difference between restarting, terminating and deleting the cluster?** 
# MAGIC 
# MAGIC Restart - used to manually restart the cluster. usefull when you need to clear the cache on the cluster.
# MAGIC 
# MAGIC Terminate - stop our cluster but the cluster configuration is maintained and can be reused using restart to set a new set of cloud resources.
# MAGIC 
# MAGIC Delete - stop and remove the cluster configuration.
# MAGIC 
# MAGIC 
# MAGIC  
# MAGIC  

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
# MAGIC 
# MAGIC - **How to run a cell, all cells above/below?** You click on the right-up corner arrow and you have all 3 commands 
# MAGIC - **How to attach cluster, clear a state of notebook, what does clearing a state means, when you need to do it?** you can attach a cluster when you want to run a command. You need to clear the state because it is saveing memory in the cache and it takes resources and money
# MAGIC - **How to create a cells in different language?** magick command or set the default language in the right-up corner
# MAGIC - **What are some of the magic commands, how can you run a different notebook from within a notebook?** %md, %sql, %python, %fl. 
# MAGIC - **What are some of the special functions databricks makes available to you?** any(expr), approx_count_distinct(expr[,relativeSD]), ...
