#!/usr/bin/env bash

## Complete the following steps to get kubernetes pods running locally

# This is your Docker ID/path
dockerpath=maweeks/nano-devops-05

# Run the Docker Hub container with kubernetes
kubectl run nano-devops-05\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=nano-devops-05

# List kubernetes pods
kubectl get pod

# Forward the container port to a host
kubectl port-forward nano-devops-05 8000:80
