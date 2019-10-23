#!/usr/bin/env bash

TAG=mysql-migration-example:1
NAME=migration-example

{
    echo "Building custom mysql image" &&
    docker build . --no-cache -t ${TAG} &&

    echo "Starting mysql database" &&
    docker run --name ${NAME} -d --rm ${TAG} &&
    echo "Waiting for mysql to be ready" &&
    sleep 10 &&

    echo "Executing test query" &&
    docker exec ${NAME} mysql --user=demo --password=demoPassword migration -e "SELECT * FROM hello;"
}

echo "Stopping mysql database"
docker stop ${NAME}
