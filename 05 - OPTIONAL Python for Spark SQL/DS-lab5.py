# Databricks notebook source
# MAGIC %md
# MAGIC #Python Control Flow
# MAGIC - You have a variable **my_var="Hello"**. Print **"Hello World!"** with use of that variable. 
# MAGIC - You have a **query** SELECT * FROM table. Use python to run this query.
# MAGIC - Write an example of a multi line string.

# COMMAND ----------

# MAGIC %md
# MAGIC **Your Answers**

# COMMAND ----------

# You have a variable my_var="Hello". Print "Hello World" with use of that variable.
# ANSWER: print(f'{my_var} World!')

# COMMAND ----------

# You have a query SELECT * FROM table. Use python to run this query.
# ANSWER: spark.sql(f"SELECT * FROM table")
