curl -o /tmp/unity.sh http://nexus.cmlatitude.local:8081/nexus/content/sites/cl-p3c-artifacts/unity.sh
/bin/bash /tmp/unity.sh -q -varfile /tmp/unity.properties -Vvalidation.skip=true 2>&1
mkdir -p /backup
cp -r /opt/unity/tomcat/conf/* /backup
rm -fr /tmp/unity.sh /tmp/init.sh
yum clean all
exit 0
