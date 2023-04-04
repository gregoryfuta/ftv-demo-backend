#!/bin/bash

cd ../calculator
docker build --no-cache .
cd ..
docker-compose up --build --force-recreate