curl -o /tmp/unity.sh http://nexus.cmlatitude.local:8081/nexus/content/sites/cl-p3c-artifacts/unity.sh
#curl -o /tmp/unity.sh http://build:QAZwsx123@teamcity.cmlatitude.com/repository/download/bt4/$BUILD:id/unity.sh
/bin/bash /tmp/unity.sh -q -varfile /tmp/unity.properties -Vvalidation.skip=true
sed -i -r -e 's@^url=.*@url=@' /opt/unity/cli/conf/unity-endpoint.properties
sed -i -r -e 's@^credentials.username=.*@credentials.username=@' /opt/unity/cli/conf/unity-endpoint.properties
sed -i -r -e 's@^credentials.password=.*@credentials.password=@' /opt/unity/cli/conf/unity-endpoint.properties
rm -fr /tmp/init.sh /tmp/unity.*
exit 0
