#!/bin/bash

COMMAND=$1
SSH_USER=$(echo $CI_SSH_USER)
SSH_HOST=$(echo $CI_SSH_HOST)

echo "comando $COMMAND"
echo "$CI_SSH_USER"
echo "$CI_SSH_HOST"


ssh -p22 $CI_SSH_USER@$CI_SSH_HOST "$COMMAND"

exit 0
