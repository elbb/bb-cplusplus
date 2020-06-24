
FROM debian:buster-slim
LABEL maintainer="elbb@conplement.de" 
LABEL description="This is a runtime image for C++ components on x86_64 architectures" 
LABEL vendor="conplement AG"
LABEL uri="https://github.com/elbb/bb-cplusplus"

RUN apt-get update &&  \
    apt-get install -y --no-install-recommends \
    gosu && \
    apt-get clean

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
