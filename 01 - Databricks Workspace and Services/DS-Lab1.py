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
# MAGIC - A DWH is a type of database/database architecture that stores structured data accumulated from multiple sources through (mostly) ETL processing
# MAGIC - Data analysis, BI, reporting
# MAGIC - The advantages of Data Warehouses:
# MAGIC     - Easy to retrieve information
# MAGIC     - Increased data security
# MAGIC     - Standardization of data which leads to consistency and accuracy
# MAGIC - The disadvantages of Data Warehouses:
# MAGIC     - Rigidity/ does not support unstructured data
# MAGIC     - Usually not cost effecitve (high maintenance)
# MAGIC     - Limited support for ML
# MAGIC     - Limited capacity for big data storage
# MAGIC - Dimensional Modeling, most commonly Star Schema, a simple stype of schema often used in data warehousing

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
# MAGIC - A Data Lake is a storage repository that holds large amounts of data in its raw format, including structured, semistructured and unstructured data
# MAGIC - Machine Learning, Data Science, AI
# MAGIC - Advantages of Data Lakes:
# MAGIC     - Flexibility/ it can store any type of data
# MAGIC     - Cost effective and scalable
# MAGIC     - Supports ML
# MAGIC - Disadvantages of Data Lakes:
# MAGIC     - Data quality issues/ lack of data governance
# MAGIC     - Security risks
# MAGIC     - Poor support for BI and analytics
# MAGIC - Data Vault approach?

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
# MAGIC - A Data Lakeshouse is a type of data architecture that provides both the data quality and security of DWHs and the flexibility and cost effectiveness of Data Lakes
# MAGIC - Data Analytics and Machine Learning
# MAGIC - Data Lakehouse advantages:
# MAGIC     - Adds governance and reliability to Data Lakes
# MAGIC     - Cost effective
# MAGIC     - Unlimited storage capacity
# MAGIC     - Supports ACID transactions
# MAGIC     - Storage and compute are decoupled
# MAGIC - Data Lakehouse disadvantages:
# MAGIC     - Unnecesary for SQL only use cases
# MAGIC     - Does not allow for some complex transformations found in DWH (checking foreign key integrity)
# MAGIC - Star Schema, Data Vault
# MAGIC - Delta files provide the low storage cost and effectiveness of Parque files with the added governance of Delta Lake
# MAGIC - Through Delta Lake, Databricks adds the benefits of DWH to the Cloud Object Storage/ Data Lake
# MAGIC     

# COMMAND ----------

# MAGIC %md
# MAGIC ### What are some of the problems organizations face when working with data?

# COMMAND ----------

# MAGIC %md
# MAGIC - Increasing volume
# MAGIC - High velocity data
# MAGIC - Difficulty in integrating different technologies
# MAGIC - Difficulty in facilitating cooperation between data engineers, analysts and scientists

# COMMAND ----------

# MAGIC %md
# MAGIC ### What are the 2 main parts of Databricks(DBX) architecture
# MAGIC - What are the components and name of the 1 parts
# MAGIC - What are the components and name of the 2 part
# MAGIC - What is the difference between the 2 parts
# MAGIC - Who manages which part of the architecture

# COMMAND ----------

# MAGIC %md
# MAGIC - The first part of DBX arcitecture is the Cloud Based Data Lake
# MAGIC - The second part of the DBX architecture is Delta Lake
# MAGIC - the 1st provides storage capacity and the 2nd provides data management and governance
# MAGIC - the 1st one is managed by the client while the 2nd one is managed by Databricks

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
# MAGIC - There are 2 types of clusters:
# MAGIC     - All-purpose cluster
# MAGIC     - Job cluster
# MAGIC - All-purpose clusters are used for collaborative data analysis while job clusters are used to run automated jobs
# MAGIC - When creating a cluster, you can select the desired runtime in the field: Databricks Runtime Version
# MAGIC - 
# MAGIC - They all start with the cluster termination event
# MAGIC     - Terminating a cluster will delete all cloud resources currently in use, without losing the code
# MAGIC     - Restarting will deploy a new set of cloud resources using the same configuration
# MAGIC     - Deleting will stop the cluster and remove the cluster configuration as well

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
# MAGIC - The purpose of DataScience&Engineering tab is to enable collaboration between data engineers, data analysts and data scientists 
# MAGIC - The purpose of SQL tab is to provide SQL analysts to perform Exploratory Data Analysis by querying data and creating visualisations  
# MAGIC - The purpose of Machine Learning tab is to create an efficient and integrated ML environment
# MAGIC - User Settings > Git Integration
# MAGIC - 
# MAGIC - 

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
# MAGIC - Shift + Alt + Up/ Shift + Alt + Down
# MAGIC - 
# MAGIC - %python, %SQL, %scala
# MAGIC - %run, %fs
# MAGIC - display()
