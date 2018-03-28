#!/bin/bash


docker build . -t mabsimms/fluentd-oms:latest
docker push mabsimms/fluentd-oms:latest

kubectl delete -f fluentd-configmap.yaml
kubectl delete -f fluentd-service.yaml

kubectl apply -f fluentd-configmap.yaml
kubectl apply -f fluentd-service.yaml
