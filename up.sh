#!/bin/bash

if ! test -f "bin/node_exporter"; then
    echo "Error: node_exporter is not present in the bin/ directory"
    exit 1
fi
# TODO: make sure docker-compose is installed

# TODO: Run API?
./bin/node_exporter --web.listen-address=:19100
docker-compose up -d

# TODO: on script termination stop docker-compose, terminate node exporter