#!/bin/sh
cd scripts || exit
LAB_ID=$(node createLab.js --appName="ftv_gage_demo")
echo "node returned labId: $LAB_ID"
cd ../frontend && npm i && npm run build
UUID=$(cat /proc/sys/kernel/random/uuid)
npx slnodejs config --tokenfile sltoken.txt --appName "React Calculator" --branch "master" --build build_$UUID
npx slnodejs scan --workspacepath ./dist --tokenfile sltoken.txt --buildsessionidfile buildSessionId --labid $LAB_ID --scm none --instrumentForBrowsers --enableOpenTelemetry --outputpath "sl_web"
npm run merge && npm run deploy
cd ../
sudo docker-compose build
