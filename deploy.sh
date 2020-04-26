#!/bin/bash


# This shell script will be part of jenkins with argument as buildName once stable to deploy new jobs

# Install before running this

DownloadedFileDir="/Users/macbook/Desktop/CNN/Project/Project"
JENKINS_DIR="/Users/macbook/.jenkins/jobs"
JMETER_DIR="/Users/macbook/Desktop/apache-jmeter-5.2.1/"
buildName="FunctionalTest"
BuildDir="$JENKINS_DIR/$buildName"
mkdir -p $BuildDir

# Script Dir
BaseDir="/Users/macbook/Desktop/CNN/Project/Project"
ScriptDir="$BaseDir/TestSuite1/"
mkdir -p $ScriptDir


mkdir -p $BaseDir/BuildFile
mkdir -p $BaseDir/WorkSpace
cp $DownloadedFileDir/build.xml $BaseDir/BuildFile/detectionBuild.xml



# Copy the jenkins config from downloaded file
cp $DownloadedFileDir/config.xml $BuildDir/config.xml
cp $DownloadedFileDir/jmeterstyle.xsl $JMETER_DIR/extras/jmeter-results-detail-report_211.xsl
cp $DownloadedFileDir/project.jmx $ScriptDir/

# Replace the variable from the current build file
#sed -i '' s/"BAS_DIR"/"$BaseDir"/g $BuildDir/config.xml
#sed -i '' s/"JM_INST_DIR"/"$JMETER_DIR"/g $BuildDir/config.xml
#sed -i '' s/"SCPT_DIR"/"$ScriptDir"/g $BuildDir/config.xml

sed -i '' "s#BAS_DIR#$BaseDir#" $BuildDir/config.xml
sed -i '' "s#JM_INST_DIR#$JMETER_DIR#" $BuildDir/config.xml
sed -i '' "s#SCPT_DIR#$ScriptDir#" $BuildDir/config.xml

#Create empty file in jenkins needed
touch $BuildDir/nextBuildNumber
echo "1" > $BuildDir/nextBuildNumber
mkdir -p $BuildDir/builds
touch $BuildDir/builds/legacyIds
touch $BuildDir/builds/permalinks

# Ant build.xml

echo "Open jenkins and run reload configuration from disk"
