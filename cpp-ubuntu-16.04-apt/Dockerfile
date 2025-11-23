FROM ubuntu:16.04 AS grpc-runtime

SHELL ["/bin/bash", "-c"]
# Install cmake and build tools
RUN apt-get update && \
    apt-get install -y \
    libgrpc-dev libprotobuf-dev protobuf-compiler-grpc protobuf-compiler