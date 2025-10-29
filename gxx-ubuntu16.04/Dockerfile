FROM ubuntu:16.04 AS grpc-builder

WORKDIR /grpc
# Install cmake and build tools
RUN apt-get update && \
    apt-get install -y git cmake make build-essential autoconf libtool pkg-config

# Cloning gRPC repo
RUN git clone --recurse-submodules -b v1.76.0 --depth 1 --shallow-submodules https://github.com/grpc/grpc

ADD install.sh install.sh
RUN chmod +x install.sh && \
    ./install.sh
