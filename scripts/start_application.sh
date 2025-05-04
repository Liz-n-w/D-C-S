#!/bin/bash
# Start the Docker container
IMAGE_URI=$(cat /var/app/docker-cicd/imagedefinitions.json | jq -r '.[0].imageUri')
echo "Starting container from image: $IMAGE_URI"

docker run -d \
  --name docker-cicd \
  -p 3000:3000 \
  --restart unless-stopped \
  $IMAGE_URI

exit 0