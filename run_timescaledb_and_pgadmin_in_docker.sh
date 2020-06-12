#!/bin/bash

read -p 'Enter containers name prefix: ' container_name;
read -p 'Enter email for pgAdmin: ' email;
read -sp 'Enter password for pgAdmin: ' password;

docker run -d --name "$container_name.timescaleDB" -p 5432:5432 timescale/timescaledb:latest-pg12;
docker run -d --name "$container_name.pgAdmin" -p 5050:80 -e "PGADMIN_DEFAULT_EMAIL=$email" -e "PGADMIN_DEFAULT_PASSWORD=$password" dpage/pgadmin4;

exit 0;
