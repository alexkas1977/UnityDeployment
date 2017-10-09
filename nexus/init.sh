curl -o /tmp/catalog.sh http://nexus.cmlatitude.local:8081/nexus/service/local/repositories/cl-p3c-artifacts/content/catalog.sh
/bin/bash /tmp/catalog.sh -q -varfile /tmp/nexus.properties -Vvalidation.skip=true 2>&1 > /dev/null
mkdir -p /opt/sonatype-work/nexus/conf/
mkdir -p /opt/sonatype-work/nexus/storage/
rm -fr /opt/sonatype-work/nexus/conf/nexus.xml /opt/sonatype-work/nexus/conf/security.xml
cp /tmp/nexus.xml /opt/sonatype-work/nexus/conf/nexus.xml
cp /tmp/security.xml /opt/sonatype-work/nexus/conf/security.xml
cp -r /tmp/unity-media-store/ /opt/sonatype-work/nexus/storage/
chown -R nexus:nexus /opt/sonatype-work/nexus/storage /opt/sonatype-work/nexus/conf

mkdir /backup
cp -vr /opt/sonatype-work /backup

rm -fr /tmp/catalog.sh /tmp/init.sh /tmp/nexus.* /tmp/unity-media-store /tmp/*.xml
yum clean all
exit 0
