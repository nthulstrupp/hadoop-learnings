#!/usr/bin/env bash

# crunchDate has the format YYYYMMDD
crunchDate=$1
# crunchYmd has the format YYYY/MM/DD
crunchYmd=$2

# create the directory where you want to upload the data in this case a partition on date
hadoop fs -mkdir s3a://location_of_bucket/${crunchYmd}/your_data_table/

# the distcp is from -> to, first we transfer the file
hadoop distcp -overwrite /your_hdfs_location/data_files/${crunchDate}.gz s3a://location_of_bucket/sources/${crunchYmd}/your_data_table/

# secoundly we transfer the schema file 
hadoop distcp -overwrite /your_hdfs_location//schema/spark_schema.json s3a://location_of_bucket/sources/${crunchYmd}/your_data_table/