#!/bin/bash

# Import environment base
source /usr/bin/environment_base.sh

# Variables
export DNSMASQ_WAIT_FOR_URL=etcd.podewitz.local:2379
export DNSMASQ_WAIT_FOR_TIME=300
