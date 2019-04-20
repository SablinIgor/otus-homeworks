#!/bin/bash

BRANCH=${TRAVIS_PULL_REQUEST_BRANCH:-$TRAVIS_BRANCH}
HOMEWORK_RUN=./otus-homeworks/express42/ansible/run.sh
DOCKER_IMAGE=express42/otus-homeworks

echo "Clone repository with tests"
git clone https://github.com/SablinIgor/otus-homeworks.git

if [ -f $HOMEWORK_RUN ]; then
	echo "Run tests"
else
	echo "We don't have tests for this homework"
	exit 0
fi
