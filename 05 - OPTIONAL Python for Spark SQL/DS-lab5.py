# Databricks notebook source
# MAGIC %md
# MAGIC #Python Control Flow
# MAGIC - You have a variable **my_var="Hello"**. Print **"Hello World!"** with use of that variable. 
# MAGIC - You have a **query** SELECT * FROM table. Use python to run this query.
# MAGIC - Write an example of a multi line string.

# COMMAND ----------

my_var = "Hello"
print(f"{my_var} World!")

# COMMAND ----------

query = "SELECT * FROM table"
query_sql = spark.sql(query)
display(query_sql)

# COMMAND ----------

query = """SELECT *
FROM TABLE"""
