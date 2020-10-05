#!/bin/bash

PATH_DEPLOY=/deploy-path

if [ ! -d "$PATH_DEPLOY" ]; then
    which git || (apt-get update -y && apt-get install git -y) > /dev/null 2>&1
    git clone https://gitlab.com/jadilson12/docker-compose-nginx $PATH_DEPLOY
    cp $PATH_DEPLOY/env-example $PATH_DEPLOY/.env
fi

cd $PATH_DEPLOY

chmod 755 -R $PATH_DEPLOY/htdocs/app/public
docker-compose up -d --force-recreate


exit 0
