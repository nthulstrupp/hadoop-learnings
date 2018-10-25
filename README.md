# hadoop-learnings

This repository contains solutions to different topics and issues I have encountered over the past year working with the hadoop (Hive, Impala, Oozie). Initially there will not be any specific ording more just to keep track of the topics


## ETL: Tranferring data from Hadoop (HDFS) to Amazon S3 bucket

As part of a project with a partner we needed to send our data to a shared S3 bucket.


## ETL: Working with oozie shell actions (Beeline CLI)

Implementing a 


## ETL: Working with CSV files (Creating tables from csv / Exporting big csv)

csv-files will always be a part of any data analyst / data scientist work, I collected some of the most used exports / imports of csv's


## Functions: Arrays & collect_set

Arrays can be a good way to collect much data in one single column, if ones want to keep it simple and have it in a string 
this can be a option. 



## Analytical: Calculating a weighted rooling average 




## Analytical: Calculating seasonal indexes (mySql)




## Folder Structure


    co_updateStuff
    |-- wf_updateStuff
    |   |-- wf_subworkflow1
    |   |   |-- hive_subworkflow1.hql
    |   |   |-- job.properties
    |   |   |-- README.md
    |   |   |-- table_subworkflow1.hql
    |   |   +-- workflow.xml
    |   |-- wf_subworkflow2
    |   |   |-- hive_subworkflow2.hql
    |   |   |-- job.properties
    |   |   |-- README.md
    |   |   |-- table_subworkflow2.hql
    |   |   +-- workflow.xml
    |   |-- job.properties
    |   |-- README.md
    |   +-- workflow.xml
    |-- job.properties
    |-- README.md
    +-- coordinator.xml