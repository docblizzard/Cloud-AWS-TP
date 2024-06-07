#!/bin/bash

docker network create reseau

docker build -t my-node-app .

docker container run --name script-node --network reseau --rm -d my-node-app

docker container run --name http-node -v $(pwd)/conf/default.conf:/etc/nginx/conf.d/default.conf -p 8081:80 --network reseau --rm -d nginx:1.25
