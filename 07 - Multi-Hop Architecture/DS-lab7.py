# Databricks notebook source
# MAGIC %md
# MAGIC 
# MAGIC #Multi-Hop architecture
# MAGIC - Multi-Hop architecture consists of three stages: Bronze, Silver and Gold. How would you describe each of these stages and their usage?
# MAGIC - What are the limitations of **complete** output mode?

# COMMAND ----------

# MAGIC %md
# MAGIC **Your answers**
# MAGIC 
# MAGIC 1. - bronze are the newest data that is not cleaned
# MAGIC 
# MAGIC    - in the silver step we just made some things with our data like joins or cast or other transformation
# MAGIC 
# MAGIC    - he gold data is the final and the cleanes data form
# MAGIC 
# MAGIC 
# MAGIC 
# MAGIC 2.  the limitation of complete output mode comes from the fact that we rewrite the data
