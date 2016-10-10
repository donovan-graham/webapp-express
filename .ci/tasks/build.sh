#!/bin/bash
set -ev

WORK_DIR=$(pwd)
SOURCE_DIR=$WORK_DIR/src
GIT_DIR=$SOURCE_DIR/.git
BUILD_DIR=$WORK_DIR/build

cd $SOURCE_DIR/webapp
npm install --no-optional --loglevel warn > /dev/null
npm test
npm prune --production --loglevel warn > /dev/null

cp -rf $SOURCE_DIR/.ci/Dockerfile $BUILD_DIR
mkdir -p $BUILD_DIR/data
cp -rf $SOURCE_DIR/webapp/* $BUILD_DIR/data

GIT_BRANCH=cat $GIT_DIR/HEAD | cut -d'/' -f3
GIT_COMMIT_HASH=cat $GIT_DIR/HEAD | cut -d':' -f2 | tr -d ' ' | xargs -I FILE cat $GIT_DIR/FILE | head -c7
GIT_URL=cat $GIT_DIR/config | grep url | cut -d'=' -f2 | tr -d ' '

cat > $BUILD_DIR/build-args.json << EOL
{
  "GIT_URL": "$GIT_URL",
  "GIT_BRANCH": "$GIT_BRANCH",
  "GIT_COMMIT_HASH": "$GIT_COMMIT_HASH"
}
EOL
