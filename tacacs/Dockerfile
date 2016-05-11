# tacacs
#
# VERSION               0.0.1
# 

FROM	debian
MAINTAINER JC Weir "devwatchdog@gmail.com"

RUN apt-get update
RUN apt-get -y install apt-utils net-tools
RUN apt-get -y install iputils-ping tacacs+

# add the locally stored backup to the docker image
# or comment out if not restoring backup
#

#VOLUME /opt/nessus
#VOLUME /opt/splunk

EXPOSE 49

#CMD ["/bin/ping", "10.22.88.50"]
CMD ["/usr/sbin/tac_plus", "-G", "-C", "/etc/tacacs+/tac_plus.conf"]
