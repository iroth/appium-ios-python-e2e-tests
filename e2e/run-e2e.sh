#!/bin/sh

# setup appium
brew install node
npm install -g appium
patch /usr/local/lib/node_modules/appium/lib/doctor/ios.js < appium-yosemite-fix.patch
appium-doctor --ios
appium &

# setup python
virtualenv ios-e2e
source ios-e2e/bin/activate
pip install -r ./requirements.txt

# build xcode project of under test app

cd ../ios/under-test
xcodebuild -sdk iphonesimulator8.1
cd -

# launch fake api server
python -m SimpleHTTPServer &

# app under test path
export UNDER_TEST_REL_PATH='../ios/under-test/Build/Release-iphonesimulator'
export UNDER_TEST_APP_FILE='under-test.app'

# run e2es
nosetests

# shut down
/bin/bash node-kill.sh appium
deactivate
pkill -f SimpleHTTPServer
