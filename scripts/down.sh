#!/bin/bash

if ! command docker-compose &> /dev/null; then
    echo "Error: docker-compose is not found in PATH"
    exit 1
fi

kill -9 `cat node_exporter.pid`
echo Node exporter is shut down
docker-compose down

rm node_exporter.pid