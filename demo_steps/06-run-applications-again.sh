#!/bin/bash

#cd ../calculator
#docker build --no-cache .
echo "Run docker-compose"
cd ..
docker-compose up --build --force-recreate