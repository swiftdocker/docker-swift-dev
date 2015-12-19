FROM ubuntu:14.04
MAINTAINER Thomas Catterall <me@swizzlr.co>

RUN apt-get update && \
    apt-get install -y \
      clang-3.6 \
      cmake \
      git \
      icu-devtools \
      libbsd-dev \
      libedit-dev \
      libicu-dev \
      libncurses5-dev \
      libpython-dev \
      libsqlite3-dev \
      libxml2-dev \
      ninja-build \
      pkg-config \
      swig \
      uuid-dev \
      && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /swift-development
