#!/usr/bin/env bash

CONTAINER_NAME="learning-grpc"

echo "Checking for \"$CONTAINER_NAME\" Docker container..."

# Check if Docker container already exists.
if [ ! "$(docker image inspect $CONTAINER_NAME 2> /dev/null)" == "[]" ]; then
    exit 0
fi

echo "Creating Docker container..."

# Builds the Docker container
docker build \
    --tag $CONTAINER_NAME \
    --force-rm \
    .
