# splunk
#
# VERSION               0.0.1
# 
# acquired some concepts from
# https://github.com/outcoldman/docker-splunk/tree/master/splunk

FROM	centos:7
MAINTAINER JC Weir "devwatchdog@gmail.com"

# needed for installing splunk rpm
RUN yum -y install which sudo

# locally stored image -- change to transfer from http site
# if needed
ADD ./splunk-6.3.3-f44afce176d0-linux-2.6-x86_64.rpm /tmp/splunk-6.3.3-f44afce176d0-linux-2.6-x86_64.rpm
RUN rpm -ih /tmp/splunk-6.3.3-f44afce176d0-linux-2.6-x86_64.rpm

# add the locally stored backup to the docker image
# or comment out if not restoring backup
#
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

#VOLUME /opt/nessus
VOLUME /opt/splunk

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["start-service"]
