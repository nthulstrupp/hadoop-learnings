-- How to create a table from a csv file (or multiple files):

-- 1. Navigate to your user directory in HDFS (and your database directory if you prefer), e.g. /user/youruser/

-- 2. Create a new directory that will contain the data for your data, e.g /user/youruser/testtable

-- 3. Upload your csv file(s) to the directory you created

-- 4. Go to Hive and create a table with the following format: 

CREATE EXTERNAL TABLE testtable (
  date string,
  metric1 int)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\;'
LOCATION
  'hdfs://nameservice1/user/youruser/testtable/'
  
-- You can now query your new table with Hive and Impala. They will automatically read all csv files that are located in this folder.
-- For impala your might need to run following statement before using it

INVALIDATE METADATA testtable

COMPUTE STATS testtable

-- Notes:

-- * Change the fields terminated by if you have a different limiter
-- * This is fine for small tables, tables you only use once or for ad hoc queries. For controller tables, production tables or regularly queried tables, you want to convert it to a different format in hadoop!