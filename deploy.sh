#!/bin/bash
DEPLOY_FOLDER=/Users/nanasafo/developer/zenexpresso/testDeploy
SRC_FOLDER=/Users/nanasafo/developer/zenexpresso/ZenExpresso
#SRC_FOLDER=$SRCDIR
echo "exported source variable ${SRCDIR}"
if [ ! -d $DEPLOY_FOLDER ];then
 mkdir -p $DEPLOY_FOLDER
fi
echo "Entering source directory path ${SRC_FOLDER}"
cd $SRC_FOLDER
echo "Current Working directory $(pwd)"
if command -v pm2 &> /dev/null
then
 echo "Stopping Application"
 pm2 stop ZenExpresso
 pm2 delete ZenExpresso
fi
echo "Restoring Nuget packages!!"
dotnet restore
echo "Building app!!"
dotnet build
dotnet publish -c Release -o $DEPLOY_FOLDER ;
echo "Published to ${DEPLOY_FOLDER}"
echo "Entering deploy directory path ${DEPLOY_FOLDER}"
echo "Current Working directory $(pwd)"
if command -v pm2 &> /dev/null
then  
 cd $DEPLOY_FOLDER
 echo "*******STARTING ZenExpresso************"
 export ASPNETCORE_ENVIRONMENT=Production
 pm2 start "dotnet ZenExpresso.dll" --name ZenExpresso
fi