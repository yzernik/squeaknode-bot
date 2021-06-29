#!/bin/bash

mkdir -p target/npm-build
shadow-cljs release app
cp README.md target/npm-build/
cp package.json target/npm-build/
chmod a+x target/npm-build/mastodon-bot.js
sha256sum target/npm-build/mastodon-bot.js > target/npm-build/mastodon-bot.js.sha256
sha512sum target/npm-build/mastodon-bot.js > target/npm-build/mastodon-bot.js.sha512
sed -i 's|SNAPSHOT|'$(date +"%Y%m%d%H%M%S")'|' ./target/npm-build/package.json
npm publish ./target/npm-build --access public