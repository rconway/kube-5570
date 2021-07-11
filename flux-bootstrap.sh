#!/usr/bin/env bash

ORIG_DIR="$(pwd)"
cd "$(dirname "$0")"
BIN_DIR="$(pwd)"

trap "cd '${ORIG_DIR}'" EXIT

flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=kube-5570 \
  --branch=main \
  --path=./cluster \
  --personal
