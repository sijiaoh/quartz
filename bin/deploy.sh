#!/bin/bash

set -eu

npm run build

touch public/.nojekyll
echo 'sijiaoh.com' > public/CNAME

if [ ! -d sijiaoh.github.io ]; then
  git clone -b gh-pages git@github.com:sijiaoh/sijiaoh.github.io.git
  cd sijiaoh.github.io
  git config --local user.email "sijiaoh@outlook.com"
  git config --local user.name "sijiaoh"
  cd -
fi

rm -rf sijiaoh.github.io/*
cp -r public/* sijiaoh.github.io

cd sijiaoh.github.io
git add --all
git commit -m \"Deploy\"
git push origin gh-pages
