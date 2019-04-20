#!/bin/bash

BRANCH=${TRAVIS_PULL_REQUEST_BRANCH:-$TRAVIS_BRANCH}
HOMEWORK_RUN=./otus-homeworks/express42/ansible/run.sh
DOCKER_IMAGE=express42/otus-homeworks

echo "Clone repository with tests"
git clone https://github.com/SablinIgor/otus-homeworks.git

if [ -f $HOMEWORK_RUN ]; then
	echo "Run tests with docker"
    # Prepare network & run container
	docker network create hw-test-net
    docker run -d -v $(pwd):/srv -v /var/run/docker.sock:/tmp/docker.sock \
		-e DOCKER_HOST=unix:///tmp/docker.sock --cap-add=NET_ADMIN -p 33433:22 --privileged \
		--device /dev/net/tun --name hw-test --network hw-test-net $DOCKER_IMAGE
    # Show versions & run tests
    docker exec -e ANSIBLE_CONFIG=$ANSIBLE_CONFIG hw-test $HOMEWORK_RUN
else
	echo "We don't have tests for this homework"
	exit 0
fi
