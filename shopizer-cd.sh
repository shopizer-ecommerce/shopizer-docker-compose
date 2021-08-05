#!/bin/bash

cd /srv/docker
sudo docker-compose stop || echo "Cannot stop docker"
sudo docker pull shopizerecomm/shopizer:latest || echo "Cannot pull latest" 
sudo docker-compose -f /srv/docker/docker-compose.yml up -d || echo "Cannot restart docker"
