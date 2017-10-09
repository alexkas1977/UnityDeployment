if [ `ls /opt/sonatype-work | wc -l` -le "1"  ]; then 
cp -vr /backup/sonatype-work /opt
fi
chown -R nexus:nexus /opt/sonatype-work
/etc/init.d/nexus start
while true
do
sleep 100
done
