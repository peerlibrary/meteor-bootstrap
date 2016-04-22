#!/bin/bash -e

export NAME='meteor-bootstrap'
export DATA_ROOT='/srv'
export METEOR_LOG="${DATA_ROOT}/${NAME}/log"

mkdir -p "$METEOR_LOG"

docker stop "${NAME}" || true
sleep 1
docker rm "${NAME}" || true
sleep 1
docker run --detach=true --restart=always --name "${NAME}" --env VIRTUAL_HOST="meteor.peerlibrary.org" --env VIRTUAL_URL=/ --volume "${METEOR_LOG}:/var/log/nginx" peerlibrary/meteor-bootstrap
