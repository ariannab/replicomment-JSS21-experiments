#!/bin/bash

##############################################################

# this script downloads the original sources of the projects we analyzed:
#
# elastic       | elasticsearch-6.1.1
# guava         | guava-19.0
# hadoop-common | hadoop-common-2.6.5
# hadoop-hdfs   | hadoop-hdfs-2.6.5
# log4j         | log4j-1.2.17
# lucene        | lucene-core-7.2.1
# rx            | rxjava-1.3.5
# solr          | solr-7.1.0
# spring        | spring-core-5.0.2
# vertx         | vertx-core-3.5.0

##############################################################

PROJECTS_SHORT=("elastic"  "guava" "hadoop-common" "hadoop-hdfs" "log4j" \
                "lucene" "rx" "solr" "spring" "vertx")
PROJECTS_LONG=("elasticsearch-6.1.1"  "guava-19.0" "hadoop-common-2.6.5" \
               "hadoop-hdfs-2.6.5" "log4j-1.2.17" "lucene-core-7.2.1" "rxjava-1.3.5"\
               "solr-7.1.0" "spring-core-5.0.2" "vertx-core-3.5.0")
PROJECTS_URL=("https://repo1.maven.org/maven2/org/elasticsearch/elasticsearch/6.1.1/elasticsearch-6.1.1-sources.jar" \
"https://repo1.maven.org/maven2/com/google/guava/guava/19.0/guava-19.0-sources.jar" \
"https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/2.6.5/hadoop-common-2.6.5-sources.jar" \
"https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-hdfs/2.6.5/hadoop-hdfs-2.6.5-sources.jar" \
"https://repo1.maven.org/maven2/log4j/log4j/1.2.17/log4j-1.2.17-sources.jar" \
"https://repo1.maven.org/maven2/org/apache/lucene/lucene-core/7.2.1/lucene-core-7.2.1-sources.jar" \
"https://repo1.maven.org/maven2/io/reactivex/rxjava/1.3.5/rxjava-1.3.5-sources.jar" \
"https://repo1.maven.org/maven2/org/apache/solr/solr-core/7.1.0/solr-core-7.1.0-sources.jar" \
"https://repo1.maven.org/maven2/org/springframework/spring-core/5.0.2.RELEASE/spring-core-5.0.2.RELEASE-sources.jar" \
"https://repo1.maven.org/maven2/io/vertx/vertx-core/3.5.0/vertx-core-3.5.0-sources.jar" )

##############################################################

mkdir -p "subjects"
cd "subjects"
rm -rf *

##############################################################

for (( i = 0; i < 10; i++ )); do

  P_SHORT=${PROJECTS_SHORT[$i]}
  P_FULL=${PROJECTS_LONG[$i]}
  P_URL=${PROJECTS_URL[$i]}

  echo "getting project ${P_SHORT}"
  mkdir ${P_SHORT}
  cd ${P_SHORT}

  echo "..downloading"
  curl -o "${P_FULL}.jar" ${P_URL}

  echo "..extracting sources"
  unzip -qq -d ${P_FULL} "${P_FULL}.jar"

  echo -e "done\n"
  cd ..

done
