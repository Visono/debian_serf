#!/bin/bash

if [ "x${SERF_ROLE}" == "x" ] ; then
    echo "No serf role specified... Serf disabled!!!"
    exit 0
fi

SNAPSHOT_DIR="/opt/serf"

mkdir -p ${SNAPSHOT_DIR}

exec serf agent -replay -rejoin -snapshot=${SNAPSHOT_DIR}/snapshot -iface=${SERF_IFACE:-"eth0"} -tag role=${SERF_ROLE} -join=${SERF_CLUSTER:-$LOADBALANCER_1_PORT_7946_TCP_ADDR}:${SERF_PORT:-7946-$LOADBALANCER_1_PORT_7946_TCP_PORT}

