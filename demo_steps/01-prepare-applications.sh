#!/bin/bash

if [ $# -lt 2 ]; then
    >&2
    echo
    echo "   LAB_ID and frontend version must be provided. Provide the lab_id that was created in the backend application."
    echo "   Ensure to copy token value to 'frontend/sltoken.txt' and 'parameters.env'"
    echo
    exit 1
fi

LAB_ID="$1"
FRONTEND_VERSION="$2"


cd ../frontend
rm -fr sl_web
rm -fr dist
npm install
npm run build

npx slnodejs config --tokenfile sltoken.txt --appName "React Calculator" --branch "master" --build "$FRONTEND_VERSION"
npx slnodejs scan --workspacepath ./dist --tokenfile sltoken.txt --buildsessionidfile buildSessionId --labid $LAB_ID --scm none --instrumentForBrowsers --enableOpenTelemetry --outputpath "sl_web"

npm run merge && npm run deploy

##
## Set the properties ENV
##

cd ..

BUILD_NO=`grep "CALC_BUILD_NAME" parameters.env`
BUILD_NO="${BUILD_NO:23:25}"
BUILD_NO="000$(($BUILD_NO + 1))"
BUILD_NO="${BUILD_NO:2}"

PATTERN="s/CALC_BUILD_NAME=build_\([0-9]\)*/CALC_BUILD_NAME=build_$BUILD_NO/g"
sed -i $PATTERN parameters.env

## LAB_ID setting

PATTERN="s/SL_LAB_ID=\([a-zA-Z0-9_]\)*/SL_LAB_ID=$LAB_ID/g"
sed -i $PATTERN parameters.env

## prepare tests

cd ../sellenium-philips-mvn

PATTERN="s/<labId>\([a-zA-Z0-9_]\)*<\/labId>/<labId>$LAB_ID<\/labId>/g"
sed -i $PATTERN pom.xml

echo "Preparation is done"