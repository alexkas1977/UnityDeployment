#!/bin/bash
docker image remove registry.cmlatitude.com:443/vixtera/unity-app:latest 2>&1 > /dev/nu
ll || true
docker image remove registry.cmlatitude.com:443/vixtera/unity-db:latest 2>&1 > /dev/nu
ll || true
docker image remove registry.cmlatitude.com:443/vixtera/unity-nexus:latest 2>&1 > /dev/nu
ll || true
docker image remove registry.cmlatitude.com:443/vixtera/unity-cli:latest 2>&1 > /dev/nu
ll || true

#docker rmi -f `docker images | awk {'print $3'} | grep -v IMAGE`
