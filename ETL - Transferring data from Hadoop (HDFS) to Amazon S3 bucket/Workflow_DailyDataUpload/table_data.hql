DROP TABLE IF EXISTS table.data;
CREATE EXTERNAL TABLE table.data (    
column1 STRING, 
column2 STRING,    
ymd INT,
ds STRING
)  
COMMENT 'data' 
STORED AS PARQUET;