#!/bin/bash

# wrapper to fix permissions of mounted volumes

if [[ -z "$DOCKER" || ! -d /home/mybcp || ! -d /usr/mybcp ]]; then
  echo -e "\033[91mDon't run this file manually\033[0m"
  exit 1
fi

# 🤷
[[ -z "$USER" ]] && USER="$(whoami)"
sudo chown -R "${USER?:USER is unset}:${USER}" /home/mybcp /usr/mybcp

if [[ "$DOCKER" == "build" ]]; then
  # this is a manual invocation, build
  ./build.sh "$@"
fi
# otherwise we ran in a dev container
