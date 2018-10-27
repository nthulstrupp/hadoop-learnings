SET mapreduce.compress.map.output=true;
SET mapreduce.map.output.compression.codec=org.apache.hadoop.io.compress.GzipCodec;
SET hive.exec.compress.output=true;
SET mapreduce.output.fileoutputformat.compress=true;
SET mapreduce.output.fileoutputformat.compress.codec=org.apache.hadoop.io.compress.GzipCodec;

SET hive.enforce.bucketing=true;

INSERT OVERWRITE TABLE table.file

SELECT 
column1, 
column2,    
ymd,
ds
FROM table.data