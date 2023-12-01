#!/bin/bash

set -eu

rm -rf content
mkdir content
cp -r ${CONTENT_DIR}/* content
npx quartz build $@
