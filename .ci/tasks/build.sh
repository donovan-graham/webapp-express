#!/bin/bash
set -ev

WORK_DIR=$(pwd)
cd $WORK_DIR/src/webapp
npm install --loglevel warn > /dev/null
npm test
npm prune --production --loglevel warn > /dev/null

ls -al $WORK_DIR/src/webpp
# cp -rf $WORK_DIR/src/webpp $WORK_DIR/build
