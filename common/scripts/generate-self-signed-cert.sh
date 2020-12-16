#!/bin/bash

# set working directory to common directory
cd "$(dirname "$0")"/..

# create tls directory if it doesn't exist
if [[ ! -d "tls" ]]; then
  mkdir tls
fi

# change to tls directory
cd tls

# generate self signed cert
openssl req \
    -subj '/CN=localhost' \
    -newkey rsa:2048 -nodes -keyout privkey.pem \
    -x509 -days 365 -out fullchain.pem

# go back to common directory
cd ..