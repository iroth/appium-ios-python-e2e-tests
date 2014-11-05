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

# run e2es
python e2e.py

# shut down
/bin/bash node-kill.sh appium
deactivate
