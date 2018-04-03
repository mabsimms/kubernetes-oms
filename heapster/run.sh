#!/bin/bash

source ../configure_test_environment.sh

docker run \
    -e OMS_WORKSPACE=$OMS_WORKSPACE \
    -e OMS_KEY=$OMS_KEY \
    mabsimms/telegraf-1.5.3-azmon:latest

