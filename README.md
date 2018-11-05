# hadoop-learnings

This repository contains solutions to different topics and issues I have encountered over the past year working with the hadoop (Hive, Impala, Oozie). Initially there will not be any specific ording more just to keep track of the topics


## ETL: Oozie workflow - with fork 

Setting up automatic workflows & and running multiple actions in parallel. 


## [ETL: Tranferring data from Hadoop (HDFS) to Amazon S3 bucket](https://github.com/nthulstrupp/hadoop-learnings/tree/master/ETL%20-%20Transferring%20data%20from%20Hadoop%20(HDFS)%20to%20Amazon%20S3%20bucket)

As part of a project with a partner we needed to send our data to a shared S3 bucket. This needed to be a automated process, so I setup a workflow in oozie that prepares a csv file, compress it and loads it to a s3-bucket

## [ETL: Working with CSV files (Creating tables from csv / Exporting big csv)](https://github.com/nthulstrupp/hadoop-learnings/tree/master/ETL%20-%20Working%20with%20CSV%20files%20-%20creating%20tables%20from%20csv)

csv-files will always be a part of any data analyst / data scientist work, I collected some of the most used exports / imports of csv's


## [ETL: Working with oozie shell actions (Beeline CLI)](https://github.com/nthulstrupp/hadoop-learnings/tree/master/ETL%20-%20Working%20with%20Oozie%20shell%20actions%20-%20Beeline%20CLI%20with%20Spark%20SQL)

Implementing a oozie shell action in a workflow that connects to a external server using JDBC-driver and Beeline CLI and executes a hive-script




## Functions: Arrays & collect_set

Arrays can be a good way to collect much data in one single column, if ones want to keep it simple and have it in a string 
this can be a option. 



## Analytical: Calculating a weighted rooling average

Simple calculation that calculates a average value 




## Folder Structure

* [Beeline CLI](https://cwiki.apache.org/confluence/display/Hive/HiveServer2+Clients#HiveServer2Clients-BeelineCommands) - General Beeline CLI

* [Oozie Shell Acions](https://oozie.apache.org/docs/4.1.0/DG_HiveActionExtension.html) - General Oozie Shell Action setup

* [Oozie Email Acions](https://oozie.apache.org/docs/3.1.3-incubating/DG_EmailActionExtension.html) - General Oozie Email Action setup





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