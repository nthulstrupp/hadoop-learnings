DROP TABLE norm_dist_minutes;
CREATE EXTERNAL TABLE norm_dist_minutes (
  offset INT,    
  weight DOUBLE
  )
COMMENT 'shows normal distribution between -30 and 30'
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe' 
	WITH SERDEPROPERTIES ( 
	  'field.delim'='\;', 
	  'serialization.format'='\;') 
	STORED AS INPUTFORMAT 
	  'org.apache.hadoop.mapred.TextInputFormat' 
	OUTPUTFORMAT 
	  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
	  LOCATION 'hdfs://nameservice1/location_to_csv_file'