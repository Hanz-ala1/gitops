#!/bin/bash

CLUSTER_NAME="name-of-cluster"
REGION="eu-west-2"

aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME

aws eks update-cluster-config --name $CLUSTER_NAME --region $REGION --resources-vpc-config endpointPublicAccess=true

sleep 120

kubectl create namespace argocd 

helm repo add argo https://argoproj.github.io/argo-helm

helm repo update 

helm search repo argo 

helm install argocd argo/argo-cd -n argocd


helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

kubectl create namespace ingress-nginx

helm install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --set controller.publishService.enabled=true
