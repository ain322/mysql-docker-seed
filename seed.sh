#!/usr/bin/env bash

docker-entrypoint.sh mysqld &

echo "Waiting for mysql to be ready"
sleep 15

echo "Seeding database"
mysql --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} database-with-seed < /data/seed.sql
echo "Seeding done"

echo "Shutting down mysql database"
mysqladmin --password=${MYSQL_ROOT_PASSWORD} shutdown
sleep 10
