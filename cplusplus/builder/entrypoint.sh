#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : ${USER_ID}"
useradd --shell /bin/bash -u ${USER_ID} -o -c "" -m user
export HOME=/home/user

mkdir -p /build
chown user:user /build

# Adding user to group tty fixes startup issues when running supervisord as user
usermod -aG tty user

exec gosu user "$@"