#!/bin/bash

./build.sh
docker stop proxy
docker rm proxy
./start.sh
