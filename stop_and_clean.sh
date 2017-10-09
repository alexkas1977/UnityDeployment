#!/bin/bash
docker-compose stop
docker-compose rm -f
docker image remove registry.cmlatitude.com:443/vixtera/unity-app:latest 2>&1 > /dev/null || true
docker image remove registry.cmlatitude.com:443/vixtera/unity-app:`head -1 unity-version.txt | sed -r -e 's/^([0-9.]*).*/\1/'` 2>&1 > /dev/null || true

docker image remove registry.cmlatitude.com:443/vixtera/unity-db:latest 2>&1 > /dev/null || true
docker image remove registry.cmlatitude.com:443/vixtera/unity-db:`head -1 unity-version.txt | sed -r -e 's/^([0-9.]*).*/\1/'` 2>&1 > /dev/null || true

docker image remove registry.cmlatitude.com:443/vixtera/unity-nexus:latest 2>&1 > /dev/null || true
docker image remove registry.cmlatitude.com:443/vixtera/unity-nexus:`head -1 catalog-version.txt | sed -r -e 's/^([0-9.]*).*/\1/'` 2>&1 > /dev/null || true

docker image remove registry.cmlatitude.com:443/vixtera/unity-cli:latest 2>&1 > /dev/null || true
docker image remove registry.cmlatitude.com:443/vixtera/unity-cli:`head -1 unity-version.txt | sed -r -e 's/^([0-9.]*).*/\1/'`  2>&1 > /dev/null || true

rm -fr application database sonatype-work unity-version.txt catalog-version.txt 
