#!/usr/bin/env bash

dockerpath="abdoesam2011/capstone-app"

kubectl run capstone-app --image=$dockerpath --port=80


kubectl get pods


kubectl expose deployment capstone-app --type=LoadBalancer --port=80


# Open the service 
# minikube service capstone-app