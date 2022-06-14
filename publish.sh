#!/bin/bash -ex

VERSION="$1"

docker build -t autonomouslogic/semantic-release:$VERSION .
docker push autonomouslogic/semantic-release:$VERSION
