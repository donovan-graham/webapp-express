#!/bin/bash
WORK_DIR=$(pwd)
cd $WORK_DIR/src/webapp
npm install --loglevel warn > /dev/null
npm test
npm prune --production --loglevel warn > /dev/null
cp -rf $WORK_DIR/src/webpp $WORK_DIR/build
