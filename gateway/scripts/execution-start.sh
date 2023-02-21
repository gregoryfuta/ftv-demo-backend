#!/bin/sh

## The variables are set in the docker-compose file. You can run in as well calling the
## docker run --env-file=FILE ...
# SL_TOKEN=token
# SL_LAB_ID=a
# SL_BRANCH_NAME=c

java -jar sl-test-listener.jar start -token $SL_TOKEN -testStage $1 -labid "$SL_LAB_ID"