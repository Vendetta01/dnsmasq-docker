#!/bin/bash

# Exit immediatley if a command exits with a non-zero status.
set -e

# Import environment
source /usr/bin/environment.sh

# initial set up of confd from environemnt
logit "INFO" "Initial configuration of confd from environment..."
confd -onetime -backend env -confdir /tmp/etc/confd/ -sync-only

logit "INFO" "Waiting for etcd..."
/usr/bin/wait-for-it.sh ${DNSMASQ_WAIT_FOR_URL} -s -t ${DNSMASQ_WAIT_FOR_TIME}

# inital configuration of app
logit "INFO" "Initial configuration of app..."
confd -onetime -confdir /etc/confd -sync-only


logit "INFO" "Starting supervisord..."
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

