#!/bin/bash

echo "Cleaning up cluster resources..."

kubectl delete all --all --all-namespaces
