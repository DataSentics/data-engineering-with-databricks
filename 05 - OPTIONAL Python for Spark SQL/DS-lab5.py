# Databricks notebook source
# MAGIC %md
# MAGIC #Python Control Flow
# MAGIC - You have a variable **my_var="Hello"**. Print **"Hello World!"** with use of that variable. 
# MAGIC - You have a **query** SELECT * FROM table. Use python to run this query.
# MAGIC - Write an example of a multi line string.

# COMMAND ----------

# MAGIC %md
# MAGIC **Your Answers**
# MAGIC You have a variable my_var="Hello". Print "Hello World!" with use of that variable.
# MAGIC my_var="Hello"
# MAGIC print(f"{my_var} World!")
# MAGIC 
# MAGIC - You have a **query** SELECT * FROM table. Use python to run this query.
# MAGIC 
# MAGIC query="SELECT * FROM table"
# MAGIC spark.sql(query)
# MAGIC 
# MAGIC - Write an example of a multi line string.
# MAGIC """
# MAGIC multi line
# MAGIC string
# MAGIC """

# COMMAND ----------



# COMMAND ----------


