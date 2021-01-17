DEPLOY_FOLDER=./var/www/inbarAdmin
echo "exported source variable ${SRCDIR}"
SRC_FOLDER=$1

if [ ! -d $DEPLOY_FOLDER ];then
 mkdir -p $DEPLOY_FOLDER
fi

cd $SRC_FOLDER
dotnet restore
dotnet build

cd $DEPLOY_FOLDER
if [command -v pm2 ]; then
 pm2 stop inbarAdmin
fi

rm -rf $DEPLOY_FOLDER -R;
dotnet publish -c Release -o $DEPLOY_FOLDER ;

pm2 start "dotnet zenExpresso.dll" --name inbarAdmin