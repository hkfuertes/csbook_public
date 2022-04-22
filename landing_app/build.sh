#!/bin/bash
rm -rf ../dist
flutter build web
cp -r build/web ../dist

