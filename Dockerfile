FROM ubuntu:bionic

# Install apt packages & update pip
RUN apt-get update && apt-get upgrade --assume-yes && apt-get install --assume-yes \
    autoconf \
    build-essential \
    clang \
    git \
    iproute2 \
    less \
    libc++-dev \
    libgflags-dev \
    libgtest-dev \
    libtool \
    make \
    pkg-config \
    vim

# Install gRPC & Protobuf
WORKDIR /root
RUN git clone --single-branch --branch master --recursive -j4 https://github.com/grpc/grpc.git && \
    cd grpc && \
    make && \
    make install && \
    cd third_party/protobuf && \
    make install

WORKDIR /root/grpc/examples
