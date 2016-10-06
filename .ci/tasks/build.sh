#!/bin/bash
set -ev

WORK_DIR=$(pwd)
cd $WORK_DIR/src/webapp
npm install --no-optional --loglevel warn > /dev/null
npm test
npm prune --production --loglevel warn > /dev/null

cp -rf $WORK_DIR/src/.ci/Dockerfile $WORK_DIR/build
mkdir -p $WORK_DIR/build/data
cp -rf $WORK_DIR/src/webapp/* $WORK_DIR/build/data
