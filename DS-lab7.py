# Databricks notebook source
# MAGIC %md
# MAGIC 
# MAGIC #Multi-Hop architecture
# MAGIC - Multi-Hop architecture consists of three stages: Bronze, Silver and Gold. How would you describe each of these stages and their usage?
# MAGIC - What are the limitations of **complete** output mode?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers**
# MAGIC - Multi-Hop architecture consists of three stages: Bronze, Silver and Gold. How would you describe each of these stages and their usage?
# MAGIC Bronze data is the initial stage of a data pipeline. One way to think of Bronze data is in raw formats, coming from many different sources, streams, or batch jobs.
# MAGIC Silver data is data that is considered cleansed and processed to make it more accessible. At this stage, data can be normalized to make it easier to query. Silver data is more sanitized, cleaner, and filtered to give a more refined view of the data.
# MAGIC . Gold data is most valuable for analytics as it is presented in a way that is well-constructed and is ready to be visualized through Business Intelligence and Analytics dashboards, or trained by Machine Learning models for predictive analytics solutions. Gold data is now ready to be leveraged across the enterprise as it has a high degree of quality as well as data integrity. 
# MAGIC 
# MAGIC - What are the limitations of **complete** output mode?
# MAGIC When using complete output mode, we rewrite the entire state of our table each time our logic runs. While this is ideal for calculating aggregates, we cannot read a stream from this directory, as Structured Streaming assumes data is only being appended in the upstream logic.
