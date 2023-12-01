#!/bin/bash

set -eu

# Skip build if CONTENT_DIR is not content
if [ "${CONTENT_DIR}" != "content" ]; then
  rm -rf content
  mkdir content
  cp -r ${CONTENT_DIR}/* content
fi
npx quartz build $@
