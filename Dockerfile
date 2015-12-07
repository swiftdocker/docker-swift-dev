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

WORKDIR /development
RUN git clone --depth 500 https://github.com/apple/swift.git swift && \
  git clone --depth 500 https://github.com/apple/swift-llvm.git llvm && \
  git clone --depth 500 https://github.com/apple/swift-lldb.git lldb && \
  git clone --depth 500 https://github.com/apple/swift-clang.git clang && \
  git clone --depth 500 https://github.com/apple/swift-cmark.git cmark && \
  git clone --depth 500 https://github.com/apple/swift-llbuild.git llbuild && \
  git clone --depth 500 https://github.com/apple/swift-corelibs-xctest.git && \
  git clone --depth 500 https://github.com/apple/swift-corelibs-foundation.git && \
  git clone --depth 500 https://github.com/apple/swift-package-manager.git swiftpm
