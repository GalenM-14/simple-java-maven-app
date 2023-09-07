#!/usr/bin/env bash

#echo 'The following Maven command installs your Maven-built Java application'
#echo 'into the local Maven repository, which will ultimately be stored in'
#echo 'Jenkins''s local Maven repository (and the "maven-repository" Docker data'
#echo 'volume).'
#set -x
mvn jar:jar install:install help:evaluate -Dexpression=project.name
#set +x

#echo 'The following complex command extracts the value of the <name/> element'
#echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
#set -x
NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]" | sed s/[^a-zA-Z0-9.-]//g`
#set +x

#echo 'The following complex command behaves similarly to the previous one but'
#echo 'extracts the value of the <version/> element within <project/> instead.'
#set -x
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]" | sed s/[^a-zA-Z0-9.-]//g`
#set +x

#ENDING="1.0-SNAPSHOT"

#echo 'The following command runs and outputs the execution of your Java'
#echo 'application (which Jenkins built using Maven) to the Jenkins UI.'
#set -x
echo "DEBUG NAME: $NAME"
echo "DEBUG VERSION: $VERSION"
echo "DEBUG FINAL PATH target/${NAME}-${VERSION}.jar": 
#echo "ENDING: $ENDING"
ls -l target
#java -jar target/${NAME}-${VERSION}-${ENDING}.jar

echo "DEBUG THIS ????????????????: NAME=$NAME"
echo "DEBUG THIS ????????????????: VERSION=$VERSION"
FULL_PATH="target/${NAME}-${VERSION}.jar"
echo "Full Path: ${FULL_PATH}"
java -jar "${FULL_PATH}"

