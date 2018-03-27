#!/bin/bash

docker build . -t mabsimms/fluentd-oms:latest
docker push mabsimms/fluentd-oms:latest
