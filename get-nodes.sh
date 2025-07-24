#!/bin/bash

echo "Fetching list of EKS nodes..."
kubectl get nodes -o wide | awk 'NR==1 {print "Node Name\tInternal IP"} NR>1 {print $1 "\t" $6}'