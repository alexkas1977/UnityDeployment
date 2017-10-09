FROM centos:6
COPY . /tmp/
VOLUME /opt/sonatype-work
RUN chmod 755 /tmp/*.sh ; sleep 5 ; /tmp/init.sh
EXPOSE 8081
ENTRYPOINT /tmp/start.sh
