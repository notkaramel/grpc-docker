FROM ubuntu:25.04

SHELL ["/bin/bash", "-c"]
# Install cmake and build tools
RUN apt-get update && \
    apt-get install -y \
    libgrpc-dev libprotobuf-dev protobuf-compiler-grpc protobuf-compiler