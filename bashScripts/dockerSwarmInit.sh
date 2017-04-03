#!/bin/bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/key01 -N ''

SSHKEY=~/.ssh/key01
SPOTPRICE=0.013
END=3
for i in $(seq 1 $END); do
    docker-machine create --driver amazonec2 --amazonec2-region ap-southeast-1 --amazonec2-security-group default \
                            --amazonec2-device-name /dev/sda1 \
                            --amazonec2-instance-type m3.medium \
                            --amazonec2-ssh-user ubuntu \
                            --amazonec2-ssh-keypath $SSHKEY  \
                            --amazonec2-spot-price $SPOTPRICE \
                            --amazonec2-request-spot-instance node-"$i"
done

eval "$(docker-machine env node-1)"
eval "$(docker swarm init --advertise-addr "$(docker-machine ip node-1)")"

TOKENWORKER=$(docker swarm join-token -q worker)
for x in $(seq 2 $END); do
    eval "$(docker-machine env node-"$x")"
    docker swarm join --token "$TOKENWORKER" \
            --advertise-addr "$(docker-machine ip node-"$x")" \
            "$(docker-machine ip node-1)":2377
done
