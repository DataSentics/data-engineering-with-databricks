# Databricks notebook source
# MAGIC %md
# MAGIC 
# MAGIC #Multi-Hop architecture
# MAGIC - Multi-Hop architecture consists of three stages: Bronze, Silver and Gold. How would you describe each of these stages and their usage?
# MAGIC - What are the limitations of **complete** output mode?

# COMMAND ----------

# MAGIC %md
# MAGIC ####Answer
# MAGIC 
# MAGIC - **How would you describe each of these stages and their usage?**
# MAGIC 
# MAGIC The Bronze layer is where we land all the data from external source systems. The table structures in this layer correspond to the source system table structures "as-is," along with any additional metadata columns 
# MAGIC 
# MAGIC The Silver layer the data from the Bronze layer is matched, merged, conformed and cleansed just enough to provide an good view of all its key business entities, concepts and transactions.
# MAGIC 
# MAGIC The Gold layer is typically organized in consumption-ready project databases. The Gold layer is for reporting and uses more de-normalized and read-optimized data models with fewer joins.
# MAGIC 
# MAGIC .
# MAGIC - **What are the limitations of complete output mode?** When using complete output mode, we rewrite the entire state of our table each time our logic runs. While this is ideal for calculating aggregates, we cannot read a stream from this directory, as Structured Streaming assumes data is only being appended in the upstream logic.
