# Sets up the environment variables for Debian
# Usage: source hadoop-stuff/debian-env.sh

export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre/"
export PATH=$JAVA_HOME/bin:$PATH
export HADOOP_CLASSPATH="/usr/lib/jvm/java-7-openjdk-amd64/lib/tools.jar"
