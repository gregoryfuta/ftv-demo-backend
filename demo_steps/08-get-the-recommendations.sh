#!/bin/bash

if [ $# -lt 1 ]; then
    >&2
    echo
    echo "   BUILD_SESSION_ID must be provided as CLI argument. Copy it from the backend UI."
    echo
    exit 1
fi

BUILD_SESSION_ID=$1
TOKEN=`cat ../frontend/sltoken.txt`

curl --location --request GET 'https://dev-kristijan-demo-gw.dev.sealights.co/api/v3/test-exclusions/'"$BUILD_SESSION_ID"'/Cucumber%20Demo' --header 'Authorization: Bearer '"$TOKEN" --header 'Content-Type: application/json' | json_pp
