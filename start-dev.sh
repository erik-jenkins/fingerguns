#!/bin/bash

# start from root directory
cd "${0%/*}"

# generate certs
cd common/scripts
./generate-self-signed-cert.sh
cd ../../FingergunsApi
./generate-development-cert.sh
cd ..

# run app in development mode
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build $1