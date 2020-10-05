#!/bin/bash

PATH_LOCAL=$1
PATH_TO=$2
SSH_USER=$(echo $CI_SSH_USER)
SSH_HOST=$(echo $CI_SSH_HOST)

eval "$(ssh-agent -s)" > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
(ssh-keyscan -H $SSH_HOST >> ~/.ssh/known_hosts) > /dev/null 2>&1

echo "$PATH_LOCAL"
echo "$PATH_TO"
echo "$CI_SSH_USER"
echo "$CI_SSH_HOST"
which rsync || (apt-get update -y && apt-get install rsync -y) > /dev/null 2>&1

rsync -rav -e ssh $PATH_LOCAL $CI_SSH_USER@$CI_SSH_HOST:/home/$CI_SSH_USER

exit 0
