#/bin/sh
set -e 

SHA=`git rev-parse --short HEAD`
VERSION=`git log --oneline | wc -l | tr -d ' '`

echo "${VERSION}-${USER}-${SHA}"
