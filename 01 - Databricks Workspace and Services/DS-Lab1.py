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
# MAGIC 
# MAGIC # Data Warehouse
# MAGIC 
# MAGIC ### What is it?
# MAGIC 
# MAGIC **DWH** stands for **Data Warehouse**.
# MAGIC 
# MAGIC It uses ETL for data manipulation. Through special tools, the data is turned into a final form and inserted into the DWH.
# MAGIC 
# MAGIC DWH is a concept, that follows 4 principles:
# MAGIC * Time-varying: Changes in data are tracked and reported so that the changes seen over time
# MAGIC * Non-volatile: Data in the DWH is never over-written or deleted. When doing changes on the data, it makes a new version of it.
# MAGIC * Integrated:  The DWH contains data from most or all the organization’s operational systems and this data is made consistent.
# MAGIC * Subject-oriented:  The data in the DWH is organized in such away that all the data elements relating to the same real-world event or object are linked together.
# MAGIC 
# MAGIC ### What is the main use case?
# MAGIC 
# MAGIC DWH is used for transactions specifically made for queries and analysis.
# MAGIC The transactions are saved with a technique called **Dimensional Modeling**
# MAGIC 
# MAGIC ### Some advantages:
# MAGIC * Intuitive
# MAGIC * High performance
# MAGIC * Addresses the problem of high complexity data structures
# MAGIC 
# MAGIC ### Some disadvantages:
# MAGIC * Updates on data are occasional, and only in batches.
# MAGIC * Inserts are run during off-hours therefore, they can be long running.
# MAGIC * Joining data is compute-heavy. 
# MAGIC 
# MAGIC ### What data modeling approach is used?
# MAGIC 
# MAGIC Dimensional Modeling, which is represented by **Star Schemas**. The name comes from the shape, as they're shaped like a star.
# MAGIC 
# MAGIC A dimensional model stored into a multidimensional database is named an **OLAP Cube**

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
# MAGIC # Data Lakes
# MAGIC 
# MAGIC ### What is it?
# MAGIC A data lake is a centralized repository
# MAGIC that allows the storage of all structured and unstructured data, at any
# MAGIC scale. The data can be stored as-is, without having to first structure it.
# MAGIC 
# MAGIC ### What is the main use case?
# MAGIC Data lakes are used to store all sorts of data, both structured and unstructured.
# MAGIC 
# MAGIC It allows running different types of analytics from dashboards and
# MAGIC visualizations to big data processing, real-time analytics, and machine learning.
# MAGIC ### Some advantages:
# MAGIC * All the infrastructure is already available in the cloud.
# MAGIC * The hardware available in the cloud is managed by the cloud provider.
# MAGIC * The security in the cloud is much higher.
# MAGIC * The data can be democratized and considered as a single source of truth. Thanks to the data lake, the data is available to the whole company.
# MAGIC * A data lake can store multi-structured data from diverse sources. In simple words, a data lake can store logs, XML, multimedia, sensor data, binary, social data, chat, people data, and any other formats to come.
# MAGIC * The possibility for advanced analytics and broad use-cases is there. Data analysts and data scientists can connect to the lake, and start prototyping their algorithms meanwhile not losing the opportunity for typical business intelligence.
# MAGIC 
# MAGIC 
# MAGIC ### Some disadvantages:
# MAGIC * There is a single source of truth available, but that is only for raw data. each user might choose a different approach and come to a different result.
# MAGIC * Everyone has to do their own cleansing, consequently resulting in wasted human resources.
# MAGIC * Data lakes usually do not support data governance henceforth the lake often becomes a mess. No one knows what data is available.
# MAGIC 
# MAGIC ### Information
# MAGIC <a href="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/9843f113-13c7-479a-b254-b78cc3058308/Data_Lakehouse_Bible_%281%29-19-21.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220907%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220907T085456Z&X-Amz-Expires=86400&X-Amz-Signature=cf5d658c1449d1721b138158774c6b698326b021cce3d71334025471c349c0f7&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Data_Lake_Intro.pdf%22&x-id=GetObject">Documentation for Data Lakes</a>

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
# MAGIC # Data Lakehouse
# MAGIC 
# MAGIC ### How Data Lakehouse works?
# MAGIC The lakehouse has dual layered architecture in which a warehouse layer resides over a data lake enforcing schema on write and providing quality and control, thus empowering the BI and reporting. It is a hybrid approach and proved an amalgamation between structured and unstructured data.
# MAGIC 
# MAGIC ### What is it?
# MAGIC Data LakeHouse is the combination between Data Lakes (With Delta Lake applied on top of it) and Data Warehouses, taking all the advantages from both.
# MAGIC 
# MAGIC ### What is the main use case?
# MAGIC Data lakehouses are useful to data scientists as they enable machine learning and business intelligence.
# MAGIC 
# MAGIC ### Advantages
# MAGIC * Less time and effort administrating.
# MAGIC * Simplified schema and data governance.
# MAGIC * Reduced data movement and redundancy.
# MAGIC * Direct access to data for analysis tools.
# MAGIC * Cost-effective data storage.
# MAGIC 
# MAGIC ### Disadvantages
# MAGIC 
# MAGIC * Relatively new and is far away to stand as a mature storage system.
# MAGIC * Need out of a box approach or else is costly to maintain.
# MAGIC * It May take time to setup.
# MAGIC * No one for all tool is yet present to utilize full potential.
# MAGIC 
# MAGIC ### Use Cases
# MAGIC * **Analysis of Clickstream Data** - as the data collected from the web can be integrated into a data lake, some of the data could be stored in the warehouse for daily reported while others for analysis.
# MAGIC * **Creating a Larger Dataset** - by copying data from sales of product from warehouses to data lakes to provide the best product recommendation
# MAGIC * **Other Situations** - for moving data from purpose-built store to another for more effortless movement taking into account the data gravity
# MAGIC 
# MAGIC ### What data format is usually used and why?
# MAGIC ## **Apache Parquet**
# MAGIC * It is language-agnostic (It is independent of programming languages)
# MAGIC * Column-based format - files are organized by column, rather than by row, which saves storage space and speeds up analytics queries.
# MAGIC * Free and open source file format.
# MAGIC * Highly efficient data compression and decompression.
# MAGIC * Used for analytics (OLAP) use cases, typically in conjunction with traditional OLTP databases.
# MAGIC * Supports complex data types and advanced nested data structures.
# MAGIC 
# MAGIC ### Benefits of Apache Parquet
# MAGIC * Good for storing big data of any kind (structured data tables, images, videos, documents).
# MAGIC * Saves on cloud storage space by using highly efficient column-wise compression, and flexible encoding schemes for columns with different data types.
# MAGIC * Increased data throughput and performance using techniques like data skipping, whereby queries that fetch specific column values need not read the entire row of data.
# MAGIC 
# MAGIC ### How does Databricks use Data Lakehouse?
# MAGIC - This lake stores the data from the entire enterprise in low-cost object storage and is stored in a format compatible with common machine learning tools but is often not organized and maintained well.

# COMMAND ----------

# MAGIC %md
# MAGIC ### What are some of the problems organizations face when working with data?

# COMMAND ----------

# MAGIC %md
# MAGIC Problems of an organizations when working with data
# MAGIC 1. Sheer Volume of Data
# MAGIC 2. Multiple Data Storages
# MAGIC 3. Data Quality
# MAGIC 4. Lack of Processes and Systems
# MAGIC 5. Data Integration
# MAGIC 6. Lack of Skilled Resources
# MAGIC 7. Data Governance
# MAGIC 8. Data Security
# MAGIC 9. Data Automation
# MAGIC 10. Data Analysis
# MAGIC 11. Going from Unstructured to Structured Data

# COMMAND ----------

# MAGIC %md
# MAGIC ### What are the 2 main parts of Databricks(DBX) architecture
# MAGIC - What are the components and name of the 1 parts
# MAGIC - What are the components and name of the 2 part
# MAGIC - What is the difference between the 2 parts
# MAGIC - Who manages which part of the architecture

# COMMAND ----------

# MAGIC %md
# MAGIC # Databricks DBX Architecture
# MAGIC 
# MAGIC **What are the components and name of the 1 parts**
# MAGIC - Control Plane: Web application, Jobs, Repos, Cluster Management
# MAGIC **What are the components and name of the 2 part**
# MAGIC - Data Plane: Databricks File System, Data Sources
# MAGIC **What is the difference between the 2 parts**
# MAGIC - Control Plane is the environment you are working on (web application, jobs, repos)and the Data Plane is where all the data is proccessed
# MAGIC **Who manages which part of the architecture**
# MAGIC - Control Plane by customers accounts, datasets, clusters and Data Plane by Cluster management (workloads)

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
# MAGIC **What type of clusters do we have?**
# MAGIC - There are two clusters: All-Purpose Cluster and Job Cluster
# MAGIC 
# MAGIC **What are the differences between them?** 
# MAGIC - **All-Purpose cluster** is used to analyze data collaboratively using notebooks by one or more people and the 
# MAGIC - **Job cluster** is  used to schedule jobs at a given time (the cluster is terminated when the job is done)
# MAGIC 
# MAGIC **How do you specify a runtime in cluster?** 
# MAGIC - When you create a cluster or edit it you can choose manually the version your cluster will run  
# MAGIC 
# MAGIC **What you need to do when configuration of cluster has changed?** 
# MAGIC - Detach and Re-attach
# MAGIC 
# MAGIC **What is the difference between restarting, terminating and deleting the cluster?** 
# MAGIC - Restart - used to manually restart the cluster. usefull when you need to clear the cache on the cluster.
# MAGIC - Terminate - stop our cluster but the cluster configuration is maintained and can be reused using restart to set a new set of cloud resources.
# MAGIC - Delete - stop and remove the cluster configuration.

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
# MAGIC **Purpose of Data Science & Engineering**
# MAGIC - To do data analysis and data transformations as per needs
# MAGIC 
# MAGIC **Purpose of SQL Tab**
# MAGIC - It's purpose is to serve Business Intelligence requirements
# MAGIC 
# MAGIC **Purpose of Machine Learning Tab**
# MAGIC - It's purpose is to do Machine Learning related stuff

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
# MAGIC **How to run a cell, all cells above/below?** 
# MAGIC - You click on the right-up corner arrow and you have all 3 commands 
# MAGIC **How to attach cluster, clear a state of notebook, what does clearing a state means, when you need to do it?** 
# MAGIC - You can attach a cluster when you want to run a command. You need to clear the state because it is saveing memory in the cache and it takes resources and money
# MAGIC **How to create a cells in different language?**
# MAGIC - Magic command or set the default language in the right-up corner
# MAGIC **What are some of the magic commands, how can you run a different notebook from within a notebook?** 
# MAGIC - %md, %sql, %python, %fl. 
# MAGIC **What are some of the special functions databricks makes available to you?**
# MAGIC - any(expr), approx_count_distinct(expr[,relativeSD]), ...
