#!/usr/bin/env bash



docker build -t capstone-app .

docker images

docker run -p 80:80 capstone-app