#!/bin/bash

docker build . --no-cache -t mabsimms/telegraf-1.5.3-azmon:latest
docker push mabsimms/telegraf-1.5.3-azmon:latest
