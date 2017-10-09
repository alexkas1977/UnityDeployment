#!/bin/bash
docker push registry.cmlatitude.com:443/vixtera/unity-app:latest
docker push registry.cmlatitude.com:443/vixtera/unity-app:`head -1 unity-version.txt | sed -r -e 's/^([0-9.]*).*/\1/'`
docker push registry.cmlatitude.com:443/vixtera/unity-db:latest
docker push registry.cmlatitude.com:443/vixtera/unity-db:`head -1 unity-version.txt | sed -r -e 's/^([0-9.]*).*/\1/'`
docker push registry.cmlatitude.com:443/vixtera/unity-nexus:latest
docker push registry.cmlatitude.com:443/vixtera/unity-nexus:`head -1 catalog-version.txt | sed -r -e 's/^([0-9.]*).*/\1/'`
docker push registry.cmlatitude.com:443/vixtera/unity-cli:latest
docker push registry.cmlatitude.com:443/vixtera/unity-cli:`head -1 unity-version.txt | sed -r -e 's/^([0-9.]*).*/\1/'`
