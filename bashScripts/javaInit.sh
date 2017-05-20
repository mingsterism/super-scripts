#!/bin/bash

sudo apt-get update && apt-get upgrade -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
sudo apt-get install oracle-java8-installer -y
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
echo "------------------------- echo JAVA_HOME -----------------------------------"
echo $JAVA_HOME
echo "------------------------- Printing java and javac versions -----------------------------------"
java -version
javac -version

