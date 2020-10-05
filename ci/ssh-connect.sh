#!/bin/bash

# SSH_PRIVATE_KEY=$(echo $CI_SSH_PRIVATE_KEY)
# SSH_USER=$(echo $CI_SSH_USER)
# SSH_HOST=$(echo $CI_SSH_HOST)
# command=$1

which ssh-agent || (apt-get update -y && apt-get install openssh-client git -y) > /dev/null 2>&1
# which rsync || ( apt-get update -y && apt-get install rsync -y )  > /dev/null 2>&1
mkdir -p ~/.ssh
echo -e "$CI_SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config



# eval "$(ssh-agent -s)" > /dev/null 2>&1
# ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
# (ssh-keyscan -H $SSH_HOST >> ~/.ssh/known_hosts) > /dev/null 2>&1

# ssh -t $SSH_USER@$SSH_HOST $command

# exit 0

# Alternative 2
# - "which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )"
# - eval $(ssh-agent -s)
# - echo "$CI_SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
# - mkdir -p ~/.ssh
# - chmod 700 ~/.ssh
# - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config'
# - echo "$CI_KNOWN_KEY_FILE" >> ~/.ssh/known_hosts
