appium-ios-python-e2e-tests
===========================
* Appium Installation
* install npm
* npm install appium
* patch for 10.10 Yosemite: https://github.com/appium/appium/commit/7df67175b734a0fb131928a808ad23bc02187c35
* app-doctor to make sure all is there (can run with --ios)
* pip install Appium-Python-Client (for python)
* pip install PyHamcrest (https://github.com/hamcrest/PyHamcrest)

Building and running:
1. setup the build directory to be relative to the workspace (under file/project settings, pick advanced and set relative to workspace)
2. run xcodebuild -sdk iphonesimulator8.1

Edit the test e2e.py file to point to your app if you change its name. Currently this is set to:
app = os.path.join(os.path.dirname(__file__),
'../ios/under-test/Build/Release-iphonesimulator',
'under-test.app')

To run the e2e test, run:
python e2e.py under the e2e directory

