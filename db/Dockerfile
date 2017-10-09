FROM centos:6
COPY . /tmp/
RUN chmod 755 /tmp/*.sh ; sleep 5 ; /tmp/init.sh
EXPOSE 3306
CMD /tmp/start.sh
