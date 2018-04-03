#!/bin/bash

source ../configure-test-environment.sh

echo $OMS_WORKSPACE > ./oms_workspace.txt
echo $OMS_KEY > ./oms_key.txt

kubectl delete secret telegraf-secret --namespace kube-system 

kubectl create secret generic telegraf-secret --namespace kube-system \
    --from-file=OMS_WORKSPACE=./oms_workspace.txt \
    --from-file=OMS_KEY=./oms_key.txt 

rm ./oms_workspace.txt
rm ./oms_key.txt

kubectl delete configmap telegraf-config --namespace kube-system
kubectl create configmap telegraf-config --namespace kube-system \
    --from-file=telegraf.conf
