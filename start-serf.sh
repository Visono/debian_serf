#!/bin/bash

exec serf agent -tag role=${SERF_ROLE} -join=${LOADBALANCER_1_PORT_7946_TCP_ADDR}:${LOADBALANCER_1_PORT_7946_TCP_PORT}