#!/bin/bash

git clone https://github.com/allinurl/goaccess.git goaccess && cd $_

docker build . -t goaccess
