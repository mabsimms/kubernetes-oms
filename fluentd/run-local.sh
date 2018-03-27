#!/bin/bash

docker build . -t fluentd-oms
docker run \
    --env OMS_WORKSPACE=$OMS_WORKSPACE \
    --env OMS_KEY=$OMS_KEY \
    fluentd-oms
