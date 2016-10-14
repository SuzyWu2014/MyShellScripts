

# start docker deamon
docker-machine --version
docker-machine start default
docker-machine env default
eval (docker-machine env default)
docker-machine ip default

boot2docker up
set -x DOCKER_HOST tcp://192.168.59.103:2376
set -x DOCKER_CERT_PATH /Users/shujinwu/.boot2docker/certs/boot2docker-vm
set -x DOCKER_TLS_VERIFY 0
docker-machine create -d virtualbox --virtualbox-import-boot2docker-vm boot2docker-vm docker-vm

# build and run container from dockerfile
docker build -t="locations_api" .
docker run -i -t locations_api
docker attach 0622b17d351b

# remove images
docker images
docker rmi -f e5eb17b8515elasticsearch8
docker rmi (docker images -q )
docker rmi (docker images -qf "dangling=true")

# remove all containers
docker stop (docker ps -a -q)
docker rm (docker ps -a -q)

docker cp 00c643502002:/home/locations-api/doej.pem doej.pem

docker exec -it d15fc8c0e1fe bash

# re-install docker for mac
