#!/bin/bash

set -e

rm -rf /var/lib/apt/lists/*
apt clean

apt update

apt install -y \
  curl \
  wget \
  unzip \
  gnupg \
  git \
  software-properties-common \
  ca-certificates \
  lsb-release \
  fontconfig \
  