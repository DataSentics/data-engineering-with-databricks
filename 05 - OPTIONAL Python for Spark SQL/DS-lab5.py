# Databricks notebook source
# MAGIC %md
# MAGIC #Python Control Flow
# MAGIC - You have a variable **my_var="Hello"**. Print **"Hello World!"** with use of that variable. 
# MAGIC - You have a **query** SELECT * FROM table. Use python to run this query.
# MAGIC - Write an example of a multi line string.

# COMMAND ----------

# MAGIC %md
# MAGIC **Your Answers**
# MAGIC #### You have a variable **my_var="Hello"**. Print **"Hello World!"** with use of that variable. 
# MAGIC my_var = "Hello"
# MAGIC print(my_var)
# MAGIC #### You have a **query** SELECT * FROM table. Use python to run this query.
# MAGIC spark.sql("SELECT * FROM table")
# MAGIC #### Write an example of a multi line string.
# MAGIC print("Multi-
# MAGIC line
# MAGIC string")
