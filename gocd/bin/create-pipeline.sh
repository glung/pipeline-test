#!/bin/sh
set -e 

GOCD_TOOLS_PATH=$(dirname "$0")

PIPELINE_XML=$1
CONTENT=`cat ${PIPELINE_XML}`

${GOCD_TOOLS_PATH}/send_server "/admin/pipelines" \
  	-H 'Accept: application/vnd.go.cd.v3+json' \
    -H 'Content-Type: application/json' \
    -X POST -d "${CONTENT}"

