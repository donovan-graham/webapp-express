#!/bin/bash
set -ev

WORK_DIR=$(pwd)
cd $WORK_DIR/src/webapp
npm install --no-optional --loglevel warn > /dev/null
npm test
npm prune --production --loglevel warn > /dev/null

cp -rf $WORK_DIR/src/webapp $WORK_DIR/build
ls -la $WORK_DIR/build
