DB_URL=$(echo $DB_URL | sed -r -e "s/\"//g")
#CATALOG_URL=$(echo $CATALOG_URL |  sed -r -e "s/\"//g")
#CATALOG_PATH=$(echo $CATALOG_PATH |  sed -r -e "s/\"//g")
if [ ! -f /opt/unity/tomcat/conf/unity.properties ]; then
cp -vr /backup/unity*.properties /opt/unity/tomcat/conf/
chown -R unity:unity /opt/unity/tomcat/conf/*
fi
if [ ! -f /opt/unity/tomcat/conf/server.xml ]; then
cp -vr /backup/*.xml /opt/unity/tomcat/conf/
chown -R unity:unity /opt/unity/tomcat/conf/*
fi
sed -i -r -e "s@jdbc:mysql:\/\/[^/]*\/unity\?@jdbc:mysql://$DB_URL?@" /opt/unity/tomcat/conf/context.xml
#sed -i -r -e "s@catalog\.api\.endpoint\.url.*@catalog.api.endpoint.url=$CATALOG_URL/api@" /opt/unity/tomcat/conf/unity-catalog-endpoint.properties
#sed -i -r -e "s@catalog\.media\.store\.url.*@catalog.media.store.url=$CATALOG_URL$CATALOG_PATH@" /opt/unity/tomcat/conf/unity-catalog-endpoint.properties
/etc/init.d/unity start
while true
do
sleep 100
done

