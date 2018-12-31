#!/usr/bin/env bash

# Check that Docker is installed.
if [ ! -x "$(command -v docker)" ]; then
    echo "Could not find Docker in path." >&2
    exit 1
fi

# Make sure Docker container exists.
./scripts/build-docker.sh

CONTAINER_NAME="learning-grpc"

# Connect to an existing container.
CONTAINER=$(docker container ls | grep $CONTAINER_NAME | cut -c 1-12)
if [ ! $CONTAINER == "" ]; then
    echo "Connecting to running container $CONTAINER..."

    docker exec \
        $DOCKER_USER \
        --interactive \
        --tty \
        $CONTAINER \
        bash

    exit 0
fi

# Run a bash shell inside the container.
docker run \
    --name ${CONTAINER_NAME}-shell \
    --mount type=bind,source="$(pwd)/cpp-streaming-client",target="/root/cpp-streaming-client" \
    --mount type=bind,source="$(pwd)/cpp-hello-world",target="/root/cpp-hello-world" \
    --interactive \
    --tty \
    --rm \
    $CONTAINER_NAME:latest \
    bash
