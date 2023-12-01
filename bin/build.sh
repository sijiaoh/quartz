#!/bin/bash

set -eu

if [ "${CI:-}" != "true" ]; then
  rm -rf content
  mkdir content
  cp -r ${CONTENT_DIR}/* content
fi
npx quartz build $@
