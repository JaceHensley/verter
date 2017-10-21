#!/bin/bash

[ -e src/popup.dart.js ] && rm src/popup.dart.js
[ -e src/event_page.dart.js ] && rm src/event_page.dart.js
[ -e src/popup.html ] && rm src/popup.html
[ -e src/popup.css ] && rm src/popup.css
[ -d src/img/ ] && rm -rf src/img/
[ -d src/packages/ ] && rm -rf src/packages/

pub get
pub build web

cp build/web/popup.dart.js src/
cp build/web/event_page.dart.js src/
cp build/web/index.html src/popup.html
cp build/web/popup.css src/
cp -R build/web/img/ src/img/
cp -R build/web/packages/ src/packages/

rm -rf build/
