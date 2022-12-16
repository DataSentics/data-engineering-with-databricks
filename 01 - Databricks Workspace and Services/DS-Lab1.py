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
# MAGIC * DWH is a place where data from various resources is stored and organized in order to be used for reporting and data analysis<br />
# MAGIC * Data reporting and analysis
# MAGIC * PROS:
# MAGIC - speedy data retreiving
# MAGIC - error identification and correction
# MAGIC - easy integration
# MAGIC * CONS:
# MAGIC - time consuming preparation
# MAGIC - costs
# MAGIC - limited due confidential information
# MAGIC * Data modeling approach: Data warehouse modeling is the process of designing and organizing your data models within your data warehouse platform. The design and organization process consists of setting up the appropriate databases and schemas so that the data can be transformed and then stored in a way that makes sense to the end user. There are three stages that can be applied:
# MAGIC         - Base or staging models (deciding the type of timestamps to use, how to name date fields, whether to use camel or snake case for naming your columns and how to define primary keys)
# MAGIC         - Intermediate models (speed up the time it takes for your data models to run and make it easier for analytics engineers to debug more complex models)
# MAGIC         - Core models (produce a fully transformed dataset that can be used by data analysts and business stakeholders)

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
# MAGIC * Data lake is a system of repository of data stored in its natural state, usually in bloob containers.
# MAGIC * It can store structured, unstructured, and semistructured data to be used for BI, machine learning or analytics.
# MAGIC * ADVANTAGES: it can store large amounts of data in a any kind of natural way they are created; it is scalable;
# MAGIC * DISADVANTAGES: poor support for BI; difficult to navigate; lower query speed; hard to append data
# MAGIC * Data Modeling Approach: ?????

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
# MAGIC * A data lakehouse can be defined as a modern data platform built from a combination of a data lake and a data warehouse.
# MAGIC * Data Analytics and Machine Learning
# MAGIC * ADVANTAGES: less administration, better data governance, increased cost-effectiveness
# MAGIC * DISADVANTAGES: it can be more expensive to set up and maintain than lakes
# MAGIC * ????? - to be studied further
# MAGIC * Delta files provide the low storage cost and effectiveness of Parque files with the added governance of Delta Lake
# MAGIC * The Databricks Lakehouse takes the best from both worlds (data warehouses, data lakes) and combines them into a platform where specialists in different areas can work collaboratively with big data.

# COMMAND ----------

# MAGIC %md
# MAGIC ### What are some of the problems organizations face when working with data?

# COMMAND ----------

# MAGIC %md
# MAGIC * Handling a Large Amount of Data
# MAGIC * Keeping up with the real time data
# MAGIC * Data Security
# MAGIC * Shortage of skilled people

# COMMAND ----------

# MAGIC %md
# MAGIC ### What are the 2 main parts of Databricks(DBX) architecture
# MAGIC - What are the components and name of the 1 parts
# MAGIC - What are the components and name of the 2 part
# MAGIC - What is the difference between the 2 parts
# MAGIC - Who manages which part of the architecture

# COMMAND ----------

# MAGIC %md
# MAGIC The two main parts of Databricks are: Control Plane and Data Plane
# MAGIC * Control Plane components: Web Applications, Repos/Notebooks, Job Scheduling, Cluster management
# MAGIC * Data Plane components: Clusters, Data Storage
# MAGIC * The two parts are managing separated aspects of the platform
# MAGIC * The Control Plane is managed by Databricks and the Data Plane is managed by the costumer

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
# MAGIC * There are two types of clusters: all purpose clusters and job clusters
# MAGIC * The all purpose clusters analyze data collaboratively using notebooks and are created via Workspace or API, the job clusters are created by the Databricks job scheduler and run automated jobs
# MAGIC * The runtime in a cluster is specified at the time of creation or can be edited provided one has the appropriate permissions. A cluster restart is most likely necessary
# MAGIC * The cluster configuration can be edited
# MAGIC * done
# MAGIC * When a cluster is terminated all cloud resources are deleted
# MAGIC      <p />A cluster is restarted when cache is needed to be cleared or to completly reset the computing environment
# MAGIC      <p />Delete will remove the cluster and its configuration

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
# MAGIC * DataScience&Engineering: is a services offered by Databricks, based on Apache Spark, used by data engineers and data scientists for working with big data 
# MAGIC * Sql: used to perform ad-hoc and exploratory data analysis on the data lake and quicly perform agile dashboard to test and validate buissness requirements
# MAGIC * Machine Learning: used to manage machine learning flows and track all assets related to ML
# MAGIC * user settings -> git integration
# MAGIC * user settings -> notebook settings
# MAGIC * admin console -> users

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
# MAGIC * To run a cell: Ctrl+Return, To run all cells above/below: Run option in the bar menu and click on the desired option, To Run All click the Run all buton in the upper right corner of the notebook
# MAGIC * To attach a cluster click on the Connect button in the upper right corner of the notebook and select the desired cluster. Click attach cluster.
# MAGIC * Dettach cluster. When the cluster is reattached the notebook will reinitialize with a clear state
# MAGIC * ?????
# MAGIC * %Python, %sql, %scala, %run
# MAGIC * dbutils
