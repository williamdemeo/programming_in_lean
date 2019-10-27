#!/usr/bin/env bash
set -e
if [ "$#" -ne 2 ]; then
    echo "Usage example: $0 avigad programming_in_lean"
    exit 1
fi

<<<<<<< HEAD
# 1. Check NPM and minify
hash npm 2>/dev/null || { echo >&2 "npm is not found. Visit https://nodejs.org/ and install node and npm."; exit 1; }

MINIFY=`npm root`/.bin/minify
if [ ! -f ${MINIFY} ] ; then
    echo ${MINIFY}
    echo >&2 "minify is not found at ${MINIFY}. Run 'npm install minify' to install it."
    exit 1
fi

# 2. Build
make
=======
# Build
make clean html latexpdf
>>>>>>> upstream/master

# 3. Deploy
rm -rf deploy
mkdir deploy
cd deploy
git init
cp -r ../_build/html/./ .
cp ../_build/latex/programming_in_lean.pdf .
git add .
git commit -m "Update `date`"
git push git@github.com:$1/$2 +HEAD:gh-pages
cd ../
rm -rf deploy
