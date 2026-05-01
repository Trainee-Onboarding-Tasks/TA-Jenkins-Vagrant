#!/bin/bash

set -e

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip -o awscliv2.zip
./aws/install
