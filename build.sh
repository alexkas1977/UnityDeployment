#!/bin/bash
build=$1
#if [ -z $build ]; then
#echo "Please enter build number parameter"
#read build
#fi

#Get version number to be built from
curl -o unity-version.txt http://nexus.cmlatitude.local:8081/nexus/content/sites/cl-p3c-artifacts/unity-version.txt
curl -o catalog-version.txt  http://nexus.cmlatitude.local:8081/nexus/content/sites/cl-p3c-artifacts/catalog-version.txt
unity_ver=`head -1 unity-version.txt | sed -r -e 's/^([0-9.]*).*/\1/'`
catalog_ver=`head -1 catalog-version.txt | sed -r -e 's/^([0-9.]*).*/\1/'`

echo "Unity version is "$unity_ver
echo "Catalog version is "$catalog_ver
echo $unity_ver > app/VERSION
echo $unity_ver > db/VERSION
echo $unity_ver > cli/VERSION
echo $catalog_ver > nexus/VERSION

echo "Building database"
cd db
docker build --no-cache --force-rm -t registry.cmlatitude.com:443/vixtera/unity-db:latest . --build-arg BUILD=$build

docker tag registry.cmlatitude.com:443/vixtera/unity-db:latest registry.cmlatitude.com:443/vixtera/unity-db:${unity_ver}

echo "Building nexus"
cd ../nexus
docker build --no-cache --force-rm -t registry.cmlatitude.com:443/vixtera/unity-nexus:latest . --build-arg BUILD=$build

docker tag registry.cmlatitude.com:443/vixtera/unity-nexus:latest registry.cmlatitude.com:443/vixtera/unity-nexus:${catalog_ver}

echo "Building application"
cd ../app
docker build --no-cache --force-rm -t registry.cmlatitude.com:443/vixtera/unity-app:latest . --build-arg BUILD=$build

docker tag registry.cmlatitude.com:443/vixtera/unity-app:latest registry.cmlatitude.com:443/vixtera/unity-app:${unity_ver}

echo "Building CLI"
cd ../cli
docker build --no-cache --force-rm -t registry.cmlatitude.com:443/vixtera/unity-cli:latest . --build-arg BUILD=$build

docker tag registry.cmlatitude.com:443/vixtera/unity-cli:latest registry.cmlatitude.com:443/vixtera/unity-cli:${unity_ver}

cd ..
