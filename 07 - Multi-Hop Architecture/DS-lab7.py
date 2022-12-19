# Databricks notebook source
# MAGIC %md
# MAGIC 
# MAGIC #Multi-Hop architecture
# MAGIC - Multi-Hop architecture consists of three stages: Bronze, Silver and Gold. How would you describe each of these stages and their usage?
# MAGIC - What are the limitations of **complete** output mode?

# COMMAND ----------

# MAGIC %md
# MAGIC - Stages:
# MAGIC   - **Bronze** - is the initial state, the raw data, unmanipulated.
# MAGIC   - **Silver** - is a cleaned version of the bronze tables. Can also include some manipulations such as joins in order to prepare the tables for gold state.
# MAGIC   - **Gold** - is the state in which data is ready to be analyzed, presented and so on, usually through aggregations.
# MAGIC - The limitations of complete output mode are that instead of appending the data, it overwrites the data in the table. This also means that it's not possible to have a live view of the data.
