FROM ubuntu:16.04 AS grpc-builder

# https://grpc.io/docs/languages/cpp/quickstart/
ENV CXX_VERSION=11
ENV CORE_COUNT=7
ENV MY_INSTALL_DIR=/usr/local
ENV PATH="$MY_INSTALL_DIR/bin:$PATH"
RUN mkdir -p $MY_INSTALL_DIR
WORKDIR /
# Install cmake and build tools
RUN apt-get update && \
    apt-get install -y git cmake make build-essential autoconf libtool pkg-config

# Cloning gRPC repo
RUN git --version
RUN git clone -b v1.76.0 --depth 1 https://github.com/grpc/grpc && \
    cd grpc && \
    git submodule update --init --recursive --depth 1

WORKDIR /grpc
RUN mkdir -p cmake/build
SHELL ["/bin/bash", "-c"]
RUN pushd cmake/build && \
    cmake -DgRPC_INSTALL=ON \
      -DgRPC_BUILD_TESTS=OFF \
      -DCMAKE_CXX_STANDARD=${CXX_VERSION} \
      -DCMAKE_INSTALL_PREFIX=${MY_INSTALL_DIR} \
      ../.. && \
    make -j ${CORE_COUNT} && \
    make install && \
    popd



