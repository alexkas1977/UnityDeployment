cat /tmp/unity_* > /tmp/unity.sh
/bin/bash /tmp/unity.sh -q -varfile /tmp/unity.properties -Vvalidation.skip=true 2>&1 
chown -R mysql:mysql /var/lib/mysql/
mkdir /backup
mysql unity -uroot -pQAZwsx123 < /tmp/unity.sql
cp -r /var/lib/mysql /backup
rm -fr /tmp/unity.* /tmp/init.sh /opt/unity
yum clean all
exit 0
