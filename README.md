appium-ios-python-e2e-tests
===========================
## Prerequisites
* Setup xcode
* Install sdks + simulators
* make sure pip and virtualenv are installed:
sudo easy_install pip
sudo pip install virtualenv

## Building and running:
1. setup the build directory to be relative to the workspace (under file/project settings, pick advanced and set relative to workspace)
2. run xcodebuild -sdk iphonesimulator8.1

Edit the test file(s) to point to your app if you change its name. Currently this is set to:
app = os.path.join(os.path.dirname(__file__),
'../ios/under-test/Build/Release-iphonesimulator',
'under-test.app')

To run the e2e test, run e2e/run-e2e.sh

--------------------
https://github.com/AndrewDryga/vagrant-box-osx-mavericks
http://sauceio.com/index.php/2013/08/guest-post-automated-ios-acceptance-testing-with-appium-cucumber-jvm-jenkins-and-sauce-labs-part-3/
http://stackoverflow.com/questions/19280249/python-equivalent-of-a-ruby-gem-file
