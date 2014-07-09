#!/bin/bash

# This script creates new drupal install
# it should be run from your new site root directory with:
# $ ./build/build.site.drupal

#read config
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CONFIG_FILE=$DIR/../build.site.conf

if [[ -f $CONFIG_FILE ]]; then
    . $CONFIG_FILE
fi

ENV_CONFIG_FILE=$DIR/../build.site.conf.env

if [[ -f $ENV_CONFIG_FILE ]]; then
    . $ENV_CONFIG_FILE
fi

# if password is passed as arg from parent script - use that, otherwise - request user entry
if [[ -n $1 ]]; then
    sudoPassword=$1
fi

if [[ -z $sudoPassword ]]; then
    echo "Enter root user password (for sudo)"
    read -s sudoPassword
fi

# remove existing site @TODO: conditionally
rm -rf ./profile

# @TODO: conditionally
echo "sync'ing from staging..."
$DIR/../build/build.site.pull

# make
echo "running make..."

# profile update
drush make --working-copy --concurrency=5 ./build/build.site.make --no-core --contrib-destination=./profile

# make
echo "running updates..."
drush -y updb