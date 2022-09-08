# Databricks notebook source
# MAGIC %md
# MAGIC 
# MAGIC #Multi-Hop architecture
# MAGIC - Multi-Hop architecture consists of three stages: Bronze, Silver and Gold. How would you describe each of these stages and their usage?
# MAGIC - What are the limitations of **complete** output mode?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers**  
# MAGIC - **Multi-Hop architecture consists of three stages: Bronze, Silver and Gold. How would you describe each of these stages and their usage?**  
# MAGIC **Bronze** tables contain raw data ingested from various sources (JSON files, RDBMS data, IoT data, to name a few examples).   
# MAGIC **Silver** tables provide a more refined view of our data. We can join fields from various bronze tables to enrich streaming records, or update account statuses based on recent activity.  
# MAGIC **Gold** tables provide business level aggregates often used for reporting and dashboarding. This would include aggregations such as daily active website users, weekly sales per store, or gross revenue per quarter by department.  
# MAGIC - **What are the limitations of complete output mode?**  
# MAGIC We cannot read a stream from this directory, as Structured Streaming assumes data is only being appended in the upstream logic.
