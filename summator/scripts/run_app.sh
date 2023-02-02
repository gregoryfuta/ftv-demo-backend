#!/bin/sh

## The variables are set in the docker-compose file. You can run in as well calling the
## docker run --env-file=FILE ...
# SL_TOKEN=token
# SL_LAB_ID=a
# SL_BUILD_NAME=b
# SL_BRANCH_NAME=c
# SL_APPNAME=d

DEBUG=-Dsl.httpDebugLog=yes
LOGGING=-Dsl.log.toConsole=true
PACKAGES="i0.sealights.demo.summator*"

java -Dsl.log.level=DEBUG "$DEBUG $LOGGING" \
  -Dsl.workspace=. \
  -Dsl.featuresData.codeCoverageManagerVersion=v2 \
  -Dsl.otel.enabled=true -Dsl.otel.loadEmbeddedAgent=true \
  -Dotel.javaagent.debug=true -Dotel.propagators=tracecontext,baggage,xray \
  -Dsl.sendInitFootprints=true \
  -Dsl.tags=demo \
  -Dsl.featuresData.enableLineCoverage=false \
  -Dsl.ignoreAutoGeneratedMethods=false \
  -Dsl.ignoreMethodsWithoutLineNumbers=false \
  -Dsl.featuresData.ignoreMethodsWithoutLineNumbers=false \
  -Dsl.featuresData.ignoreAutoGeneratedMethods=false \
  -Dsl.buildMapBatchSize=500 \
  -Dsl.includes="$PACKAGES" \
  -Dsl.token="$SL_TOKEN" \
  -Dsl.labId="$SL_LAB_ID" \
  -Dsl.buildName="$SL_BUILD_NAME" \
  -Dsl.branchName="$SL_BRANCH_NAME" \
  -Dsl.appName="$SUM_APPNAME" \
  -javaagent:./sl-cd-agent.jar \
  -jar $1