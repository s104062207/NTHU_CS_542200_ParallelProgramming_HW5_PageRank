#!/bin/bash

# Do not uncomment these lines to directly execute the script
# Modify the path to fit your need before using this script

TEMP_I=tempPath1 
OUTPUT_DIR=output
JAR=PageRank.jar

ITER=-1
INPUT_SIZE=100M
OUTPUT_FILE=homework/HW5/pagerank_$INPUT_SIZE.out


hdfs dfs -rm $OUTPUT_FILE 
hdfs dfs -rm -r $OUTPUT_DIR $TEMP_I 
hadoop jar $JAR pagerank.PageRank $INPUT_SIZE $ITER
hdfs dfs -getmerge $OUTPUT_DIR $OUTPUT_FILE

INPUT_SIZE=10G
OUTPUT_FILE=homework/HW5/pagerank_$INPUT_SIZE.out

hdfs dfs -rm $OUTPUT_FILE 
hdfs dfs -rm -r $OUTPUT_DIR $TEMP_I 
hadoop jar $JAR pagerank.PageRank $INPUT_SIZE $ITER
hdfs dfs -getmerge $OUTPUT_DIR $OUTPUT_FILE

hw5-judge 100M 21 "homework/HW5/pagerank_100M.out"
hw5-judge 1G 22 "homework/HW5/pagerank_1G.out"
hw5-judge 10G 22 "homework/HW5/pagerank_10G.out"
hw5-judge 50G 16 "homework/HW5/pagerank_50G.out"