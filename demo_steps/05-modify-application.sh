#!/bin/bash

cp ../calculator/src/main/java/i0/sealights/demo/calculator/service/CalculatorService.txt \
    ../calculator/src/main/java/i0/sealights/demo/calculator/service/CalculatorService.java

cd ..

BUILD_NO=`grep "CALC_BUILD_NAME" parameters.env`
BUILD_NO="${BUILD_NO:23:25}"
BUILD_NO="000$(($BUILD_NO + 1))"
BUILD_NO="${BUILD_NO:2}"

PATTERN="s/CALC_BUILD_NAME=build_\([0-9]\)*/CALC_BUILD_NAME=build_$BUILD_NO/g"
sed -i $PATTERN parameters.env