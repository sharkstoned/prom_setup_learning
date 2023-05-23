#!/bin/bash

if test -f "node_exporter.pid"; then
    echo "Warning: node exporter is already running. Exiting.."
    exit
fi

if ! test -f "bin/node_exporter"; then
    echo "Error: node_exporter is not present in the bin/ directory"
    exit 1
fi
if ! command docker-compose &> /dev/null; then
    echo "Error: docker-compose is not found in PATH"
    exit 1
fi
# TODO: make sure docker-compose is installed

# TODO: Run API?
TIMESTAMP=$(date "+%s")
nohup ./bin/node_exporter --web.listen-address=:19100 > logs/node_exporter_$TIMESTAMP.log 2>&1 & echo $! > node_exporter.pid
echo Node exporter is running on host machine
docker-compose up -d
