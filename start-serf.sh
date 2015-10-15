#!/bin/bash


if [ "x${SERF_ROLE}" == "x" ]; then
    echo "No serf role specified... Serf disabled!!!"
    exit 0
fi

SNAPSHOT_DIR="/opt/serf"

mkdir -p ${SNAPSHOT_DIR}

if [ "x${SERF_CLUSTER}" != "x" ]; then
    exec serf agent -replay -rejoin -snapshot=${SNAPSHOT_DIR}/snapshot -tag role=${SERF_ROLE} -join=${SERF_CLUSTER}:7946
else
    exec serf agent -replay -rejoin -snapshot=${SNAPSHOT_DIR}/snapshot -tag role=${SERF_ROLE} -join=${LOADBALANCER_1_PORT_7946_TCP_ADDR}:${LOADBALANCER_1_PORT_7946_TCP_PORT}
fi

