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
    vim && \
    rm --force --recursive /var/lib/apt/lists/*

# Install gRPC & Protobuf
WORKDIR /root
RUN git clone --branch=master --depth=1 --jobs=8 --recursive --single-branch \
    https://github.com/grpc/grpc.git && \
    cd grpc && \
    make && \
    make install && \
    cd third_party/protobuf && \
    make install
