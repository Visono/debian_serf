#!/bin/bash

SNAPSHOT_DIR="/opt/serf"

mkdir -p ${SNAPSHOT_DIR}

exec serf agent -replay -rejoin -snapshot=${SNAPSHOT_DIR}/snapshot -tag role=${SERF_ROLE} -join=${LOADBALANCER_1_PORT_7946_TCP_ADDR}:${LOADBALANCER_1_PORT_7946_TCP_PORT}