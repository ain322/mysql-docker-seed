#!/usr/bin/env bash

TAG=mysql-seed-example:1
NAME=seed-example

{
    echo "Building custom mysql image" &&
    docker build . --no-cache -t ${TAG} &&

    echo "Starting mysql database" &&
    docker run --name ${NAME} -d --rm ${TAG} &&
    echo "Waiting for mysql to be ready" &&
    sleep 10 &&

    echo "Executing test query" &&
    docker exec ${NAME} mysql --user=demo --password=demoPassword database-with-seed -e "SELECT * FROM seeded_table;"
}

echo "Stopping mysql database"
docker stop ${NAME}
