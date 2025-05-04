#!/bin/bash
# Pull the newest image
IMAGE_URI=$(cat /var/app/docker-cicd/imagedefinitions.json | jq -r '.[0].imageUri')
echo "Pulling image: $IMAGE_URI"
docker pull $IMAGE_URI

exit 0