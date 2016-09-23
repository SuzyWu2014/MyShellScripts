

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

curl https://192.168.99.100:8080/api/v0/locations/dining -k --user "username:password"
curl https://192.168.99.100:8080/api/v0/locations/extension -k --user "username:password"
curl https://192.168.99.100:8080/api/v0/locations/arcgis -k --user "username:password"

curl -s -XPOST http://192.168.99.100:9200/locations/locations/_bulk --data-binary "@locations-arcgis.json"; echo
curl -s -XPOST http://192.168.99.100:9200/locations/locations/_bulk --data-binary "@locations-extension.json"; echo
curl -s -XPOST http://192.168.99.100:9200/locations/locations/_bulk --data-binary "@locations-dining.json"; echo

docker run -p 8088:8088 -p 8089:8089 \
      -v $PWD/keypair/doej.keystore:/home/api/locations-frontend-api/doej.keystore \
      -v $PWD/keypair/doej.truststore:/home/api/locations-frontend-api/doej.truststore \
      -v $PWD/location-frontend-api/configuration.yaml:/home/api/locations-frontend-api/configuration.yaml \
      --link elasticsearch:elasticsearch -i -t \
      --net dockerlocationapissetup_default frontend

curl https://192.168.99.100:8088/api/v0/locations/a5041ecde8b53e54c7479e770825d7c1 -k --user "username:password"


curl https://localhost:8080/api/v0/locations/dining -k --user "username:password"
curl https://localhost:8080/api/v0/locations/extension -k --user "username:password"
curl https://localhost:8080/api/v0/locations/arcgis -k --user "username:password"


curl -s -XPOST http://elasticsearch:9200/locations/locations/_bulk --data-binary "@campusmap.json"; echo

curl -s -XPOST http://elasticsearch:9200/locations/locations/_bulk --data-binary "@locations-arcgis.json"; echo
curl -s -XPOST http://elasticsearch:9200/locations/locations/_bulk --data-binary "@locations-extension.json"; echo
curl -s -XPOST http://elasticsearch:9200/locations/locations/_bulk --data-binary "@locations-dining.json"; echo



curl https://localhost:8088/api/v0/locations/a5041ecde8b53e54c7479e770825d7c1 -k --user "username:password"

