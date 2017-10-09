curl -o /tmp/unity.sh http://nexus.cmlatitude.local:8081/nexus/content/sites/cl-p3c-artifacts/unity.sh
#curl -o /tmp/unity.sh http://build:QAZwsx123@teamcity.cmlatitude.com/repository/download/bt4/$BUILD:id/unity.sh
/bin/bash /tmp/unity.sh -q -varfile /tmp/unity.properties -Vvalidation.skip=true 2>&1 
chown -R mysql:mysql /var/lib/mysql/
mkdir /backup
mysql unity -uroot -pQAZwsx123 < /tmp/unity.sql
cp -r /var/lib/mysql /backup
rm -fr /tmp/unity.* /tmp/init.sh /opt/unity
yum clean all
exit 0
