#!/bin/bash
# a few bits borrowed from 
# https://github.com/outcoldman/docker-splunk/blob/master/splunk/entrypoint.sh
# 


if [ "$1" = 'splunk' ]; then
  shift
  /bin/su - splunk -c /opt/splunk/bin/splunk "$@"
elif [ "$1" = 'start-service' ]; then
# If version file exists already - this Splunk has been configured before
  if [ ! -f /opt/splunk/etc/var ]; then
     /bin/su - splunk -c '/opt/splunk/bin/splunk start \
         --accept-license --answer-yes --no-prompt' \
      trap "/bin/su - splunk -c /opt/splunk/bin/splunk stop" \
          SIGINT SIGTERM EXIT; else
     /bin/su - splunk -c /opt/splunk/bin/splunk start
      trap "/bin/su - splunk -c /opt/splunk/bin/splunk stop" \
          SIGINT SIGTERM EXIT
  fi
/bin/su - splunk -c 'tail -n 0 -f /opt/splunk/var/log/splunk/splunkd_stderr.log' &
  wait
else
  "$@"
fi
