-- How to export a hive/impala table/query as csv?

-- 0. Check if the table/query you want to export will have a reasonable size.
-- It makes no sense to download tenths or hundreds of millions of rows to work with them on your laptop.
 
-- 1. OPTIONAL: These options will compress your csv file with gz. It is very convenient to download your data but the final compression itself will add a few minutes.
SET mapreduce.compress.map.output=true;
SET mapreduce.map.output.compression.codec=org.apache.hadoop.io.compress.GzipCodec;
SET hive.exec.compress.output=true;
SET mapreduce.output.fileoutputformat.compress=true;
SET mapreduce.output.fileoutputformat.compress.codec=org.apache.hadoop.io.compress.GzipCodec;

-- 2. Export to a csv file (with this Hive query) in the hdfs directory /user/youruser/exportcsv (the directory must exist already). Don't forget the "ORDER BY 1" part or you'll end up with multiple files.
INSERT OVERWRITE DIRECTORY '/user/youruser/exportcsv'
ROW FORMAT DELIMITED 
 FIELDS TERMINATED BY ','
 COLLECTION ITEMS TERMINATED BY ';'
 MAP KEYS TERMINATED BY '='
 LINES TERMINATED BY '\n'
 NULL DEFINED AS '\\N' 
STORED AS TEXTFILE
-- replace your query below:
SELECT * FROM test_table
-- keep the "ORDER BY 1" below, unless your query already ends with an "ORDER BY" clause
ORDER BY 1;

-- 3. Download the file 000000_0 from the hdfs directory

Hue user id and the rest of the path is up to you. Make sure the path exists in hdfs). 


-- 4. The file 000000_0 contains your data but it must be renamed to either 000000_0.csv or 000000_0.gz, depending on how you exported the data. 
Also note that this export doesn't add a header with the column names to the file. If it is needed you must add it yourself (sorry for that but there's no way to put it in with this type of export).

-- 5. Delete the folder in hdfs (adjust the hdfs directory, in this example is /user/youruser/exportcsv).