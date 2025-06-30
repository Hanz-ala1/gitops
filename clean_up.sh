#!/bin/bash

echo "Cleaning up cluster resources..."

kubectl delete ingress --all
kubectl delete svc --all
kubectl delete deployments --all
kubectl delete ns ingress-nginx