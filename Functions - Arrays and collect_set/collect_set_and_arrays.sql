
-- Creating an STRING, when it is not possible to have ARRAY as datatype 
-- hive: Using collect_set with a delimiter
-- COLLECT_SET returns an array, with which you can then concatenate the entries into a single comma-separated value using CONCAT_WS


SET mapreduce.compress.map.output=true;
SET mapreduce.map.output.compression.codec=org.apache.hadoop.io.compress.GzipCodec;
SET hive.exec.compress.output=true;
SET mapreduce.output.fileoutputformat.compress=true;
SET mapreduce.output.fileoutputformat.compress.codec=org.apache.hadoop.io.compress.GzipCodec;

INSERT OVERWRITE TABLE concatenateData_Table
SELECT
	product_id, 
	concat_ws("-", collect_set(companyName)) as concatenate_companyNames 
FROM 
	External_Table
GROUP BY 
	product_id



	
-- Then using this in practise you can now filter using `array_contains`

SELECT 
	product_id
FROM 
	concatenateData_Table
WHERE
	array_contains(split(companyName,'-'),companyA) -- return a BOOLEAN so no need to =TRUE


-- Links: 	
-- https://stackoverflow.com/questions/22627473/hive-check-comma-separated-string-contains-a-string 
-- https://stackoverflow.com/questions/28949914/hive-using-collect-set-with-a-delimiter
	

