#!/bin/bash

set -eu

npm run build

touch public/.nojekyll
echo 'sijiaoh.com' > public/CNAME

if [ "${CI:-}" != "true" ]; then
  rm -rf sijiaoh.github.io
  git clone -b gh-pages --depth 1 git@github.com:sijiaoh/sijiaoh.github.io.git
fi

cd sijiaoh.github.io
git config --local user.email "sijiaoh@outlook.com"
git config --local user.name "sijiaoh"
cd -

rm -rf sijiaoh.github.io/*
cp -r public/* sijiaoh.github.io
cp public/.nojekyll sijiaoh.github.io
cp content/.gitattributes sijiaoh.github.io

cd sijiaoh.github.io
git add --all
git commit -m \"Deploy\"
git push origin gh-pages
