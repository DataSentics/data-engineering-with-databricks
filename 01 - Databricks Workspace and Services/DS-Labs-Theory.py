# Databricks notebook source
# MAGIC %md
# MAGIC #Lab 1

# COMMAND ----------

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
# MAGIC ####Answer:
# MAGIC  - **What is it:** A data warehouse is a relational data management system that is designed to support BI activities
# MAGIC  
# MAGIC  - **What is the main use case:** It is used to perform queries and analysis
# MAGIC  
# MAGIC  - **What are some of the advantages:** Can contain large amounts of data, perform accurate analysis, has ELT solutions, subject-oriented and nonvolatile
# MAGIC  
# MAGIC  - **What are some of the disadvantages:** When performing bigger jobs it is hard to scale, can store only structured data (e.g. tables)
# MAGIC  
# MAGIC  - **What data modeling approach is used:**  Architecture for Data Warehousing and Business Intelligence. (Star Schema)

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
# MAGIC ####Answer:
# MAGIC  - **What is it:** A centralized repository designed to store, process, and secure large amounts of structured, semistructured, and unstructured data. It can store data in any type of format and process any variety of it.
# MAGIC  
# MAGIC  - **What is the main use case:** It is used mainly for data science and machine learning
# MAGIC  
# MAGIC  - **What are some of the advantages:** Store any type of data, inexpensive storage
# MAGIC  
# MAGIC  - **What are some of the disadvantages:** hard to maintain it clean (can become a data swapm), poor bi performance
# MAGIC  
# MAGIC  - **What data modeling approach is used:** Data Vaults

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
# MAGIC ####Answer:
# MAGIC - **What is it?** A data lakehouse is a data management architecture that combines the flexibility, cost-efficiency, and scale of data lakes with the data management and ACID transactions of data warehouses, enabling BI and machine learning (ML) on all data.
# MAGIC 
# MAGIC - **What is the main use case?** It is used to merge the access and support for enterprise analytics capabilities found in data warehouses with the flexibility and relatively low cost of the data lake.
# MAGIC 
# MAGIC - **What are some of the advantages?** Less time and effort administrating, simplified schema and data governance, reduced data movement and redundancy, direct access to data for analysis
# MAGIC 
# MAGIC - **What are some of the disadvantages?** Underestimation of data loading resources, hidden problems in source systems, data homogenization
# MAGIC 
# MAGIC - **What data modeling approach is used?** Data Vaults and Star Schemas
# MAGIC 
# MAGIC - **What data format is usually used and why?** Open-data formats (Parquet) that makes it straightforward for data scientists and machine learning engineers to utilize the data.

# COMMAND ----------

# MAGIC %md
# MAGIC ### What are some of the problems organizations face when working with data?

# COMMAND ----------

# MAGIC %md
# MAGIC ####Answer:
# MAGIC The big companies had a problem with quickli returning point queries because the data sets are rapidly changing and costs continued to scale delta lake decouples computes and storage costs and provides optimized performance on data

# COMMAND ----------

# MAGIC %md
# MAGIC ### What are the 2 main parts of Databricks(DBX) architecture
# MAGIC - What are the components and name of the 1 parts
# MAGIC - What are the components and name of the 2 part
# MAGIC - What is the difference between the 2 parts
# MAGIC - Who manages which part of the architecture

# COMMAND ----------

# MAGIC %md
# MAGIC ####Answer:
# MAGIC - **What are the components and name of the 1 parts** Control Plane: Web application, Jobs, Repos, Cluster Management
# MAGIC 
# MAGIC - **What are the components and name of the 2 part** Data Plane: Databricks File System, Data Sources
# MAGIC 
# MAGIC - **What is the difference between the 2 parts** Control Plane is the environment you are working on (web application, jobs, repos)and the Data Plane is where all the data is proccessed
# MAGIC 
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
# MAGIC ####Answer:
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
# MAGIC ####Answer:
# MAGIC - **What is the purpose of DataScience&Engineering?** 
# MAGIC 
# MAGIC data sciente - cleans and analyzes data, answers questions, and provides metrics to solve business problems
# MAGIC 
# MAGIC data engineer - develops, tests, and maintains data pipelines and architectures
# MAGIC 
# MAGIC - **What is the purpose of SQL Tab?** access the SQL UI from the application
# MAGIC 
# MAGIC - **What is the purpose of Machine Learning tab** access the ML UI from the application
# MAGIC 
# MAGIC - **Where can you insert the github API token**? In the API Keys tab of the app registration
# MAGIC 
# MAGIC - **Where can you change the number of spaces for tab?**
# MAGIC 
# MAGIC - **Where can you manage access to databricks for other people?** 

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
# MAGIC ####Answer:
# MAGIC - **How to run a cell, all cells above/below?** You click on the right-up corner arrow and you have all 3 commands 
# MAGIC 
# MAGIC - **How to attach cluster, clear a state of notebook, what does clearing a state means, when you need to do it?** you can attach a cluster when you want to run a command. You need to clear the state because it is saveing memory in the cache and it takes resources and money
# MAGIC 
# MAGIC - **How to create a cells in different language?** magick command or set the default language in the right-up corner
# MAGIC 
# MAGIC - **What are some of the magic commands, how can you run a different notebook from within a notebook?** %md, %sql, %python, %fl. 
# MAGIC 
# MAGIC - **What are some of the special functions databricks makes available to you?** any(expr), approx_count_distinct(expr[,relativeSD]), ...

# COMMAND ----------

# MAGIC %md
# MAGIC #Lab 2

# COMMAND ----------

# MAGIC %md 
# MAGIC ### Delta Lake
# MAGIC - What it is?
# MAGIC - What advantages does it bring?
# MAGIC - What does ACID mean? Why do we need it? 
# MAGIC - What it is not?
# MAGIC - On top of what format it is built?

# COMMAND ----------

# MAGIC %md
# MAGIC ####Answer:
# MAGIC - **What it is?** Is a open source project that enables building a data lakehouse on top of existing storage system 
# MAGIC 
# MAGIC - **What advantages does it bring?** It is open source, builds upon standard data formats, optimized for cloud object storage, build for scalable metadata handling
# MAGIC 
# MAGIC - **What does ACID mean? Why do we need it?** 
# MAGIC 
# MAGIC A - atomicity: transaction either succed or fail completly
# MAGIC 
# MAGIC C - consistency: data is in a consistent state when a transaction starts and when it ends
# MAGIC 
# MAGIC I - isolation: how simultanious operations conflict one to another
# MAGIC 
# MAGIC D - durability: commited changes are permanent
# MAGIC 
# MAGIC - **What it is not?** Proprietary technology, storage format, storage medium, database service or data warehouse  
# MAGIC 
# MAGIC - **On top of what format it is built?** Data Lake 
