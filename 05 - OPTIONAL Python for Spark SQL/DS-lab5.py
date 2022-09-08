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

# 1.
my_var = "Hello"
print(my_var +"World!")

# COMMAND ----------

query = "SELECT * FROM table"
# spark.sql(query)

# COMMAND ----------

multi_line = """
line 1
line 2
line 3
"""

# COMMAND ----------


