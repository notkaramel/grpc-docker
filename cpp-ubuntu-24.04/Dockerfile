FROM ubuntu:24.04 AS grpc-builder

# https://grpc.io/docs/languages/cpp/quickstart/
ENV CXX_VERSION=23
ENV CORE_COUNT=7
ENV MY_INSTALL_DIR=/usr/local
ENV PATH="$MY_INSTALL_DIR/bin:$PATH"
ENV GRPC_VERSION=v1.76.0
RUN mkdir -p $MY_INSTALL_DIR
WORKDIR /
# Install cmake and build tools
RUN apt-get update && \
    apt-get install -y git cmake make build-essential autoconf libtool pkg-config

# Cloning gRPC repo
RUN git clone --recurse-submodules -b ${GRPC_VERSION} --depth 1 --shallow-submodules https://github.com/grpc/grpc

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

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /grpc/cmake/build && \
    rm -rf /root/.cache && \
    find /usr/local -name '*.a' -delete

FROM ubuntu:24.04 AS grpc-runtime

ENV MY_INSTALL_DIR=/usr/local
ENV PATH="$MY_INSTALL_DIR/bin:$PATH"
RUN mkdir -p $MY_INSTALL_DIR
COPY --from=grpc-builder /usr/local /usr/local

CMD ["/bin/bash"]



