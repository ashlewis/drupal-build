#!/bin/bash

ID='unknown'

# detect centos
grep 'centos' /etc/issue -i -q
if [ $? = '0' ]; then
    ID='centos'
# could be debian or ubuntu
elif [ $(which lsb_release) ]; then
    ID=$(lsb_release -i | cut -f2)
elif [ -f '/etc/lsb-release' ]; then
    ID=$(cat /etc/lsb-release | grep DISTRIB_ID | cut -d "=" -f2)
elif [ -f '/etc/issue' ]; then
    ID=$(head -1 /etc/issue | cut -d " " -f1)
fi

declare -A info

info[id]=$(echo "${ID}" | tr '[A-Z]' '[a-z]')

echo "${info[id]}"
exit 0