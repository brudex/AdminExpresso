DEPLOY_FOLDER=/var/www/inbarAdmin
echo "exported source variable ${SRCDIR}"
SRC_FOLDER=$SRCDIR
if [ ! -d $DEPLOY_FOLDER ];then
 mkdir -p $DEPLOY_FOLDER
fi
echo "Entering source directory path ${SRC_FOLDER}"
cd $SRC_FOLDER
echo "Current Working directory $(pwd)"
if [ type "$(pm2)" &> /dev/null  ]; then
 echo "Stopping Application"
 pm2 stop inbarAdmin
 pm2 delete inbarAdmin
fi
echo "Restoring Nuget packages!!"
dotnet restore
echo "Building app!!"
dotnet build
echo "Deleting old application files"
rm -rf $DEPLOY_FOLDER/*
dotnet publish -c Release -o $DEPLOY_FOLDER ;
echo "Published to ${DEPLOY_FOLDER}"
echo "Entering deploy directory path ${DEPLOY_FOLDER}"
cd $DEPLOY_FOLDER
echo "Current Working directory $(pwd)"
if [ -e ZenExpresso.dll ]; then
 export ASPNETCORE_ENVIRONMENT=Production
 pm2 start "dotnet ZenExpresso.dll" --name inbarAdmin
fi