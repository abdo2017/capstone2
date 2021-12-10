#!/usr/bin/env bash


dockerpath="abdoesam2011/capstone-app"

echo "Docker ID and Image: $dockerpath"

docker image tag capstone-app $dockerpath

docker push $dockerpath