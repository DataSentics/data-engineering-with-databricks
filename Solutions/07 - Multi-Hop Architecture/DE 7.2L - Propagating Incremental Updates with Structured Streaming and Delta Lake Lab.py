# Databricks notebook source
# MAGIC %md-sandbox
# MAGIC 
# MAGIC <div style="text-align: center; line-height: 0; padding-top: 9px;">
# MAGIC   <img src="https://databricks.com/wp-content/uploads/2018/03/db-academy-rgb-1200px.png" alt="Databricks Learning" style="width: 600px">
# MAGIC </div>

# COMMAND ----------

# MAGIC %md <i18n value="0e458ce0-d210-41e2-8d96-836d7355de16"/>
# MAGIC 
# MAGIC 
# MAGIC # Propagating Incremental Updates with Structured Streaming and Delta Lake
# MAGIC 
# MAGIC ## Learning Objectives
# MAGIC By the end of this lab, you should be able to:
# MAGIC * Apply your knowledge of structured streaming and Auto Loader to implement a simple multi-hop architecture

# COMMAND ----------

# MAGIC %md <i18n value="8cf2e657-3b59-4f53-a86e-6acabcd8aa16"/>
# MAGIC 
# MAGIC 
# MAGIC ## Setup
# MAGIC Run the following script to setup necessary variables and clear out past runs of this notebook. Note that re-executing this cell will allow you to start the lab over.

# COMMAND ----------

# MAGIC %run ../Includes/Classroom-Setup-07.2L

# COMMAND ----------

# MAGIC %md <i18n value="4d9563b5-a6dc-4106-a5bf-168d374a968e"/>
# MAGIC 
# MAGIC 
# MAGIC 
# MAGIC ## Ingest data
# MAGIC 
# MAGIC This lab uses a collection of customer-related CSV data from the **retail-org/customers** dataset.
# MAGIC 
# MAGIC Read this data using Auto Loader using its schema inference (use **`customers_checkpoint_path`** to store the schema info). Stream the raw data to a Delta table called **`bronze`**.

# COMMAND ----------

# ANSWER
customers_checkpoint_path = f"{DA.paths.checkpoints}/customers"
dataset_source = f"{DA.paths.datasets}/retail-org/customers/"

query = (spark.readStream
              .format("cloudFiles")
              .option("cloudFiles.format", "csv")
              .option("cloudFiles.schemaLocation", customers_checkpoint_path)
              .load(dataset_source)
              .writeStream
              .format("delta")
              .option("checkpointLocation", customers_checkpoint_path)
              .outputMode("append")
              .table("bronze"))

# COMMAND ----------

DA.block_until_stream_is_ready(query)

# COMMAND ----------

# MAGIC %md <i18n value="8b05f1fa-9046-4eba-8698-004b6c10fb79"/>
# MAGIC 
# MAGIC Run the cell below to check your work.

# COMMAND ----------

assert spark.table("bronze"), "Table named `bronze` does not exist"
assert spark.sql(f"SHOW TABLES").filter(f"tableName == 'bronze'").first()["isTemporary"] == False, "Table is temporary"
assert spark.table("bronze").dtypes ==  [('customer_id', 'string'), ('tax_id', 'string'), ('tax_code', 'string'), ('customer_name', 'string'), ('state', 'string'), ('city', 'string'), ('postcode', 'string'), ('street', 'string'), ('number', 'string'), ('unit', 'string'), ('region', 'string'), ('district', 'string'), ('lon', 'string'), ('lat', 'string'), ('ship_to_address', 'string'), ('valid_from', 'string'), ('valid_to', 'string'), ('units_purchased', 'string'), ('loyalty_segment', 'string'), ('_rescued_data', 'string')], "Incorrect Schema"

# COMMAND ----------

# MAGIC %md <i18n value="f999d572-86c1-4c0a-afbe-dad08cc7eb5a"/>
# MAGIC 
# MAGIC 
# MAGIC 
# MAGIC Let's create a streaming temporary view into the bronze table, so that we can perform transforms using SQL.

# COMMAND ----------

(spark
  .readStream
  .table("bronze")
  .createOrReplaceTempView("bronze_temp"))

# COMMAND ----------

# MAGIC %md <i18n value="14a123fc-6cae-4780-b2fb-08ffa1da4989"/>
# MAGIC 
# MAGIC 
# MAGIC ## Clean and enhance data
# MAGIC 
# MAGIC Using CTAS syntax, define a new streaming view called **`bronze_enhanced_temp`** that does the following:
# MAGIC * Skips records with a null **`postcode`** (set to zero)
# MAGIC * Inserts a column called **`receipt_time`** containing a current timestamp
# MAGIC * Inserts a column called **`source_file`** containing the input filename

# COMMAND ----------

# MAGIC %sql
# MAGIC -- ANSWER
# MAGIC CREATE OR REPLACE TEMPORARY VIEW bronze_enhanced_temp AS
# MAGIC SELECT
# MAGIC   *, current_timestamp() receipt_time, input_file_name() source_file
# MAGIC   FROM bronze_temp
# MAGIC   WHERE postcode > 0

# COMMAND ----------

# MAGIC %md <i18n value="4369381f-b2e0-4d88-9ccd-bcd6ff100f98"/>
# MAGIC 
# MAGIC Run the cell below to check your work.

# COMMAND ----------

assert spark.table("bronze_enhanced_temp"), "Table named `bronze_enhanced_temp` does not exist"
assert spark.sql(f"SHOW TABLES").filter(f"tableName == 'bronze_enhanced_temp'").first()["isTemporary"] == True, "Table is not temporary"
assert spark.table("bronze_enhanced_temp").dtypes ==  [('customer_id', 'string'), ('tax_id', 'string'), ('tax_code', 'string'), ('customer_name', 'string'), ('state', 'string'), ('city', 'string'), ('postcode', 'string'), ('street', 'string'), ('number', 'string'), ('unit', 'string'), ('region', 'string'), ('district', 'string'), ('lon', 'string'), ('lat', 'string'), ('ship_to_address', 'string'), ('valid_from', 'string'), ('valid_to', 'string'), ('units_purchased', 'string'), ('loyalty_segment', 'string'), ('_rescued_data', 'string'), ('receipt_time', 'timestamp'), ('source_file', 'string')], "Incorrect Schema"
assert spark.table("bronze_enhanced_temp").isStreaming, "Not a streaming table"

# COMMAND ----------

# MAGIC %md <i18n value="ff38de01-61d2-4ffc-a5ca-aac815d8fb1e"/>
# MAGIC 
# MAGIC 
# MAGIC ## Silver table
# MAGIC 
# MAGIC Stream the data from **`bronze_enhanced_temp`** to a table called **`silver`**.

# COMMAND ----------

# ANSWER
silver_checkpoint_path = f"{DA.paths.checkpoints}/silver"

query = (spark.table("bronze_enhanced_temp")
              .writeStream
              .format("delta")
              .option("checkpointLocation", silver_checkpoint_path)
              .outputMode("append")
              .table("silver"))

# COMMAND ----------

DA.block_until_stream_is_ready(query)

# COMMAND ----------

# MAGIC %md <i18n value="41b4d01f-c855-40da-86a9-6d36de39d48a"/>
# MAGIC 
# MAGIC Run the cell below to check your work.

# COMMAND ----------

assert spark.table("silver"), "Table named `silver` does not exist"
assert spark.sql(f"SHOW TABLES").filter(f"tableName == 'silver'").first()["isTemporary"] == False, "Table is temporary"
assert spark.table("silver").dtypes ==  [('customer_id', 'string'), ('tax_id', 'string'), ('tax_code', 'string'), ('customer_name', 'string'), ('state', 'string'), ('city', 'string'), ('postcode', 'string'), ('street', 'string'), ('number', 'string'), ('unit', 'string'), ('region', 'string'), ('district', 'string'), ('lon', 'string'), ('lat', 'string'), ('ship_to_address', 'string'), ('valid_from', 'string'), ('valid_to', 'string'), ('units_purchased', 'string'), ('loyalty_segment', 'string'), ('_rescued_data', 'string'), ('receipt_time', 'timestamp'), ('source_file', 'string')], "Incorrect Schema"
assert spark.table("silver").filter("postcode <= 0").count() == 0, "Null postcodes present"

# COMMAND ----------

# MAGIC %md <i18n value="e8fef108-ec3e-4404-9307-84cc3b593f99"/>
# MAGIC 
# MAGIC 
# MAGIC 
# MAGIC Let's create a streaming temporary view into the silver table, so that we can perform business-level aggregation using SQL.

# COMMAND ----------

(spark
  .readStream
  .table("silver")
  .createOrReplaceTempView("silver_temp"))

# COMMAND ----------

# MAGIC %md <i18n value="e37aaafc-d774-4635-9ca4-163446d98ac7"/>
# MAGIC 
# MAGIC 
# MAGIC 
# MAGIC ## Gold tables
# MAGIC 
# MAGIC Using CTAS syntax, define a new streaming view called **`customer_count_temp`** that counts customers per state in a column named **`customer_count`**.

# COMMAND ----------

# MAGIC %sql
# MAGIC -- ANSWER
# MAGIC CREATE OR REPLACE TEMPORARY VIEW customer_count_temp AS
# MAGIC SELECT state, count(customer_id) AS customer_count
# MAGIC FROM silver_temp
# MAGIC GROUP BY
# MAGIC state

# COMMAND ----------

# MAGIC %md <i18n value="7b1502ab-f64b-4491-8104-fa46521c4dc0"/>
# MAGIC 
# MAGIC Run the cell below to check your work.

# COMMAND ----------

assert spark.table("customer_count_temp"), "Table named `customer_count_temp` does not exist"
assert spark.sql(f"SHOW TABLES").filter(f"tableName == 'customer_count_temp'").first()["isTemporary"] == True, "Table is not temporary"
assert spark.table("customer_count_temp").dtypes ==  [('state', 'string'), ('customer_count', 'bigint')], "Incorrect Schema"

# COMMAND ----------

# MAGIC %md <i18n value="413fe655-e9c0-42ca-8bd9-e7f45c98d2ad"/>
# MAGIC 
# MAGIC 
# MAGIC Finally, stream the data from the **`customer_count_temp`** view to a Delta table called **`gold_customer_count_by_state`**.

# COMMAND ----------

# ANSWER
customers_count_checkpoint_path = f"{DA.paths.checkpoints}/customers_counts"

query = (spark.table("customer_count_temp")
              .writeStream
              .format("delta")
              .option("checkpointLocation", customers_count_checkpoint_path)
              .outputMode("complete")
              .table("gold_customer_count_by_state"))

# COMMAND ----------

DA.block_until_stream_is_ready(query)

# COMMAND ----------

# MAGIC %md <i18n value="a4073245-d0e0-41a2-b107-16357064b596"/>
# MAGIC 
# MAGIC Run the cell below to check your work.

# COMMAND ----------

assert spark.table("gold_customer_count_by_state"), "Table named `gold_customer_count_by_state` does not exist"
assert spark.sql(f"show tables").filter(f"tableName == 'gold_customer_count_by_state'").first()["isTemporary"] == False, "Table is temporary"
assert spark.table("gold_customer_count_by_state").dtypes ==  [('state', 'string'), ('customer_count', 'bigint')], "Incorrect Schema"
assert spark.table("gold_customer_count_by_state").count() == 51, "Incorrect number of rows" 

# COMMAND ----------

# MAGIC %md <i18n value="28b96faa-5b44-4e66-bc49-58ad9fa80f2e"/>
# MAGIC 
# MAGIC 
# MAGIC 
# MAGIC ## Query the results
# MAGIC 
# MAGIC Query the **`gold_customer_count_by_state`** table (this will not be a streaming query). Plot the results as a bar graph and also using the map plot.

# COMMAND ----------

# MAGIC %sql
# MAGIC SELECT * FROM gold_customer_count_by_state

# COMMAND ----------

# MAGIC %md <i18n value="c6bbef1b-0139-41c5-889b-f1cf1a56f907"/>
# MAGIC 
# MAGIC 
# MAGIC ## Wrapping Up
# MAGIC 
# MAGIC Run the following cell to remove the database and all data associated with this lab.

# COMMAND ----------

DA.cleanup()

# COMMAND ----------

# MAGIC %md <i18n value="971fb9e2-1315-47d1-bb18-ae0835b5bcde"/>
# MAGIC 
# MAGIC 
# MAGIC By completing this lab, you should now feel comfortable:
# MAGIC * Using PySpark to configure Auto Loader for incremental data ingestion
# MAGIC * Using Spark SQL to aggregate streaming data
# MAGIC * Streaming data to a Delta table

# COMMAND ----------

# MAGIC %md-sandbox
# MAGIC &copy; 2022 Databricks, Inc. All rights reserved.<br/>
# MAGIC Apache, Apache Spark, Spark and the Spark logo are trademarks of the <a href="https://www.apache.org/">Apache Software Foundation</a>.<br/>
# MAGIC <br/>
# MAGIC <a href="https://databricks.com/privacy-policy">Privacy Policy</a> | <a href="https://databricks.com/terms-of-use">Terms of Use</a> | <a href="https://help.databricks.com/">Support</a>
