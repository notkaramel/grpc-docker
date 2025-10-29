FROM ubuntu:25.04 as grpc-builder

WORKDIR /player

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    pkg-config \
    libssl-dev \
    autoconf \
    libtool \
    sudo

ADD install_gRPC.sh /player/install_gRPC.sh
RUN chmod +x /player/install_gRPC.sh
RUN install_gRPC.sh 

FROM golang:1.24 as builder
WORKDIR /player
COPY --from=grpc-builder /usr/local /usr/local
