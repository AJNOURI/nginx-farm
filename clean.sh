#!/bin/bash

# AJN: ajn.bin@gmail.com

daemon=`cat /var/run/docker.pid 2> /dev/null`
if [ -z "$daemon" ]; then
    echo "Docker daemon not running" >&2
    service docker start
else
    echo "Docker daemon running"
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

