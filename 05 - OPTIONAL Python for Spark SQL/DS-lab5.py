# Databricks notebook source
# MAGIC %md
# MAGIC #Python Control Flow
# MAGIC - You have a variable **my_var="Hello"**. Print **"Hello World!"** with use of that variable. 
# MAGIC - You have a **query** SELECT * FROM table. Use python to run this query.
# MAGIC - Write an example of a multi line string.

# COMMAND ----------

# MAGIC %md
# MAGIC **Your Answers**  
# MAGIC - **You have a variable my_var="Hello". Print "Hello World!" with use of that variable.**  
# MAGIC print(f"{my_var} World!")  
# MAGIC - **You have a query SELECT * FROM table. Use python to run this query.**  
# MAGIC display(spark.sql(query))  
# MAGIC - **Write an example of a multi line string.**  
# MAGIC """My name is  
# MAGIC Daniela and  
# MAGIC i have 6 dogs  
# MAGIC and 2  cats!  
# MAGIC """
