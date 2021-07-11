#!/usr/bin/env bash

ORIG_DIR="$(pwd)"
cd "$(dirname "$0")"
BIN_DIR="$(pwd)"

trap "cd '${ORIG_DIR}'" EXIT

k3d cluster create -p "8080:80@loadbalancer" -p "8443:443@loadbalancer" --agents 2 rconway
