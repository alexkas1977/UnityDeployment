FROM centos:6
COPY . /tmp/
VOLUME /opt/unity/tomcat/conf
RUN chmod 755 /tmp/*.sh ; sleep 5 ; /tmp/init.sh
EXPOSE 8080
ENTRYPOINT /tmp/start.sh
