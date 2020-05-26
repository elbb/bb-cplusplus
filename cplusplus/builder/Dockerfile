
FROM debian:buster-slim
LABEL maintainer="elbb@conplement.de" 
LABEL description="This is a builder image for C++ components on x86_64 architectures" 
LABEL vendor="conplement AG"
LABEL uri="https://github.com/elbb/bb-cplusplus"

RUN apt-get update &&  \
    apt-get install -y --no-install-recommends \
    gosu \
    build-essential \
    cmake && \
    apt-get clean

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENV BUILD_DIR=${BUILD_DIR:-/build}
ENV SRC_DIR=${SRC_DIR:-/source}
ENV INSTALL_DIR=${INSTALL_DIR:-/install}

WORKDIR /build

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]