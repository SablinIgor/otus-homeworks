#!/bin/bash

BRANCH=${TRAVIS_PULL_REQUEST_BRANCH:-$TRAVIS_BRANCH}
DOCKER_IMAGE=express42/otus-homeworks

echo "Clone repository with tests"
