#!/bin/bash

NAME="openvpn_holder"
IMAGE="openvpn_holder"
PORT=9050
# DNS : OpenDNS Home
DNS=208.67.222.222

# Start container (if not already started)
if [ ! "$(docker ps -q -f name=$IMAGE)" ]; then

    docker run \
    --hostname "${NAME}" \
    --name "${NAME}" \
    --privileged \
    --interactive \
    --detach \
    --dns $DNS \
    -p $PORT:1080 \
    $IMAGE

fi

# Connect to shell
docker exec -it \
	$NAME \
	./bin/bash -c 'cd /etc/openvpn; exec "${SHELL:-sh}"'
