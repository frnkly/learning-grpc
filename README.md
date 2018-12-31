# Learning to use gRPC

A simple [Docker container](https://docs.docker.com) for playing around with [gRPC](https://grpc.io). Use the following command to run a bash shell inside the container:

```shell
# Build the Docker container and run a bash shell:
./run shell
```

From within the container, you may run any of the sample code from the [gRPC repository](https://github.com/grpc/grpc):

```shell
# Run the C++ "Hello World" example.
./run shell
cd ~/grpc/examples/cpp/helloworld
make
./greeter_server

# Then, run the following in a separate terminal. Using `./run shell` a second
# time connects to the running container instead of creating a new one.
./run shell
cd ~/grpc/examples/cpp/helloworld
./greeter_client
```

## C++ streaming client

```shell

```
