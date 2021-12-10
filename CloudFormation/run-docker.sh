#!/usr/bin/env bash



sudo docker build -t capstone-app .

sudo docker images

sudo docker run -p 80:80 capstone-app


# aws eks --region us-west-2 update-kubeconfig --name CapstoneEKS-UEdB71F8J2DZ