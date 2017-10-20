#!/bin/bash

[ -e src/popup.js ] && rm src/popup.js
[ -e src/popup.html ] && rm src/popup.html
[ -e src/popup.css ] && rm src/popup.css
[ -d src/img/ ] && rm -rf src/img/
[ -d src/vendor/ ] && rm -rf src/vendor/
[ -d src/packages/ ] && rm -rf src/packages/

pub get
pub build web

cp build/web/popup.dart.js src/
cp build/web/index.html src/popup.html
cp build/web/popup.css src/
cp -R build/web/img/ src/img/
cp -R build/web/vendor/ src/vendor/
cp -R build/web/packages/ src/packages/

rm -rf build/
