#!/bin/sh

## The variables are set in the docker-compose file. You can run in as well calling the
## docker run --env-file=FILE ...
# SL_TOKEN=token
# SL_LAB_ID=a
# SL_BRANCH_NAME=c

java -jar sl-test-listener.jar end -token $SL_TOKEN -labid "$SL_LAB_ID"