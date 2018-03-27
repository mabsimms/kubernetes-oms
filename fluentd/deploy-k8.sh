#!/bin/bash

echo "Configuring K8 cluster"
NAMESPACE=monitoring

# Add node labels to all relevant nodes that will have
# monitoring collectors deployed
 # Label all of the agent nodes for log collection
LABEL='beta.kubernetes.io/fluentd-ds-ready=true'
NODES=($(kubectl get nodes --selector=kubernetes.io/role=agent -o jsonpath='{.items[*].metadata.name}'))
for node in "${NODES[@]}"
do
    echo "adding label:$LABEL to node:$node"
    kubectl label nodes "$node" $LABEL 
done

# Create the service account and role bindings - TODO - create custom clusterrole
kubectl create namespace $NAMESPACE
kubectl create serviceaccount fluentd-es --namespace $NAMESPACE
kubectl create clusterrolebinding fluentd-es \
	--clusterrole=system:heapster-with-nanny \
    --serviceaccount=kube-system:fluentd-es \
    --namespace $NAMESPACE

# Deploy fluentd for moving system logs to ELK
kubectl create -f fluentd-configmap.yaml
kubectl create -f fluentd-service.yaml

# Deploy heapster for logging to influxdb
kubectl apply -f heapster-to-influx.yaml
