#!/bin/bash
set -e

apt-get update -y

apt-get install -y openjdk-21-jdk


# Jenkins repo key
mkdir -p /etc/apt/keyrings

wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" | tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null


apt-get update -y
apt-get install -y jenkins
