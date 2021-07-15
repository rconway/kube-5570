#!/usr/bin/env bash

ORIG_DIR="$(pwd)"
cd "$(dirname "$0")"
BIN_DIR="$(pwd)"

trap "cd '${ORIG_DIR}'" EXIT

mkdir -p "${HOME}/longhorn"

k3d cluster create \
  --agents 2 \
  -p "8080:80@loadbalancer" -p "8443:443@loadbalancer" \
  --volume ${HOME}/longhorn:/var/lib/longhorn:shared \
  rconway
