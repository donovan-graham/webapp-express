#!/bin/bash
set -ev

WORK_DIR=$(pwd)
SOURCE_DIR=$WORK_DIR/src
GIT_DIR=$SOURCE_DIR/.git
BUILD_DIR=$WORK_DIR/build

cd $SOURCE_DIR/webapp
yarn install > /dev/null
npm test

cp -rf $SOURCE_DIR/.ci/Dockerfile $BUILD_DIR
mkdir -p $BUILD_DIR/data
rm -rf node_modules
cp -rf $SOURCE_DIR/webapp/* $BUILD_DIR/data
cd $BUILD_DIR/data
yarn install --production > /dev/null

GIT_COMMIT_HASH=$(cat $GIT_DIR/HEAD | cut -d'/' -f3 | cut -c1-7)
GIT_URL=$(cat $GIT_DIR/config | grep url | cut -d'=' -f2 | tr -d ' ')

cat > $BUILD_DIR/build-args.json << EOL
{
  "GIT_URL": "${GIT_URL}",
  "GIT_COMMIT_HASH": "${GIT_COMMIT_HASH}"
}
EOL
