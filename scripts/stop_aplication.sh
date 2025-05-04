#!/bin/bash
# Stop running container if it exists
if [ $(docker ps -q -f name=docker-cicd) ]; then
    echo "Stopping running container..."
    docker stop docker-cicd
    docker rm docker-cicd
fi

exit 0