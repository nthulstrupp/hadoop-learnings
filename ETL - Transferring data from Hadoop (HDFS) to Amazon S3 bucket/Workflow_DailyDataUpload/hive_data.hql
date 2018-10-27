INSERT OVERWRITE TABLE table.data

SELECT
column1,
column2,
date as ymd,
SUBSTR(timestamp,1,10) as ds
FROM
your_database