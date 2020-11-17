#!/bin/bash

# load and export env files
set -o allexport
source default.env
[[ -f local.env ]] && source local.env
set +o allexport

container_name=bb-cplusplus-gdb-multiarch

if [[ "$2" == "aarch64" ]]; then
    binary_dir=`dirname "$0"`/gen/cplusplus-service-aarch64-dev:/install
elif [[ "$2" == "armv7hf" ]]; then
    binary_dir=`dirname "$0"`/gen/cplusplus-service-armv7hf-dev:/install
else
    binary_dir=`dirname "$0"`/gen/cplusplus-service-x86_64-dev:/install
fi

if [ $(docker ps | grep ${container_name} | wc -l) -eq 0 ]; then
    docker run --rm -i -d -v ${binary_dir} --network "host" --name "${container_name}" elbb/bb-cplusplus-builder:${VERSION_BB_CPLUSPLUS_BUILDER} /bin/bash
fi
docker exec -i  ${container_name} gdb-multiarch $1
docker stop ${container_name}
