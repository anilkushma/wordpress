#!/bin/bash
echo "Create a local Kubernetes cluster"
k3d cluster create anil
 
echo"Addding a worker node to the cluster"
k3d node create anilworker --cluster anil
 
echo "Deploying Wordpress to the cluster"
kubectl apply -f mysql.yaml
kubectl apply -f wordpress-deployment.yaml
echo "Verify the deployment"
kubectl get deployments
kubectl get pods
kubectl get svc
