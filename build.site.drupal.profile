#!/bin/bash

# This script creates new drupal install
# it should be run from your new site root directory with:
# $ ./build/build.site.profile

#read config
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/build.site.conf.incl

# if password is passed as arg from parent script - use that, otherwise - request user entry
if [[ -n $1 ]]; then
    sudoPassword=$1
fi

if [[ -z $sudoPassword ]]; then
    echo "Enter root user password (for sudo)"
    read -s sudoPassword
fi

# remove existing site @TODO: conditionally
echo "deleting existing profile dir..."
rm -rf $devRootDir/profiles/s8080

# @TODO: conditionally
#echo "sync'ing from staging..."
#$DIR/../build/build.site.pull

# make
echo "running make..."

# profile update
drush make --working-copy --concurrency=5 $devRootDir/build/build.site.make --no-core --contrib-destination=$devRootDir/profile

# enter root dir
cd $devRootDir/$webDir

# make
echo "running updates..."
drush -y updb