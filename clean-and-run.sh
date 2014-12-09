#!/bin/bash

# Cleans HDFS output, compiles a .java, packs it into a .jar, and runs
# Hadoop with it, its arguments being input folder and output folder

# Hadoop bin/ folder must be in your $PATH

# Usage: hadoop-stuff/clean-and-run.sh <username> <foldername> <classname>

set -e

if [ $# -ne 3 ]
then
   echo "Usage: hadoop-stuff/clean-and-run.sh <username> <foldername> <classname>"
   exit 1
fi

# cd into correct directory
cd ${2}

# Cleans the filesystem
hdfs dfs -rm -r /user/${1}/${2}/output || true

# Compiles java
hadoop com.sun.tools.javac.Main ${3}.java

# Creates the jar
jar cf output.jar ${3}*.class

# Runs Hadoop
hadoop jar output.jar ${3} /user/${1}/${2}/input /user/${1}/${2}/output

# Print results
hdfs dfs -cat /user/${1}/${2}/output/*
