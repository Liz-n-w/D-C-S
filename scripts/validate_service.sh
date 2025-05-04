#!/bin/bash
# Wait for the application to be available
sleep 10

# Check if the application is running
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/health)

if [ $STATUS_CODE -eq 200 ]; then
    echo "Application is running successfully!"
    exit 0
else
    echo "Application is not running properly. Status code: $STATUS_CODE"
    exit 1
fi