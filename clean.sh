#!/bin/bash

# AJN: ajn.bin@gmail.com

service docker status
if [ $? -eq 0 ]; then
    echo "Docker OK" 
else
    echo "Restarting Docker daemon"
    service docker start
fi

echo ''
echo ''
# Stop running containers
echo 'Stopping all running containers...'
if [[ -n $(docker ps -q) ]]; then
    docker stop $(docker ps -q)
else
    echo "No running containers."
fi

# Removing stopped containers
echo ''
echo ''
echo 'Removing all stopped containers...'
if [[ -n $(docker ps -a -q) ]]; then
    docker rm $(docker ps -a -q)
else
    echo "No containers found."
fi

