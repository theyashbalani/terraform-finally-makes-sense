#!/bin/bash

# Install prerequisites
sudo apt update -y
sudo apt install unzip -y

# Architecture based Installation
if [ $(uname -m) = x86_64 ]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

elif [ $(uname -m) = aarch64 ]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"

else
    echo "Unsupported architecture: $(uname -m)"
    exit 1
fi

unzip awscliv2.zip
sudo ./aws/install

# Verify Installation
aws --version

