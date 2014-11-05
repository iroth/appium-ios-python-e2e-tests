"""
under-test Product List E2E Test
"""
from hamcrest import *
import unittest
import os
from random import randint
from appium import webdriver
from time import sleep
import json
from subprocess import call


class ProductListTests(unittest.TestCase):

    def setUp(self):

        # launch fake api server
        call("python -m SimpleHTTPServer &", shell=True)

    def tearDown(self):
        # kill fake api server
        call("pkill -f SimpleHTTPServer", shell=True)
        # quit appium web driver
        self.driver.quit()

    def given_a_store_with_products(self, products):
        out = {
                'products' : products
                }
        f = open('api_mock/product_list.json', 'w')
        f.write(json.dumps(out))
        f.close()
        return

    def navigate_to_product_list_screen(self):
        # set up appium
        app = os.path.join(os.path.dirname(__file__),
                           '../ios/under-test/Build/Release-iphonesimulator',
                           'under-test.app')
        app = os.path.abspath(app)
        self.driver = webdriver.Remote(
                                      command_executor='http://127.0.0.1:4723/wd/hub',
                                      desired_capabilities={
                                      'app': app,
                                      'platformName': 'iOS',
                                      'platformVersion': '8.1',
                                      'deviceName': 'iPhone Simulator'
                                      })
        return
    
    def screen_product_list(self):
        cells = self.driver.find_elements_by_xpath('//UIACollectionView/UIACollectionCell/UIAStaticText')
        product_names = map(lambda c: c.text, cells)
        return product_names
    
    def test_product_list_populated(self):
        
        test_product_list = ["Red Shoes", "Blue Velvet"]
        self.given_a_store_with_products(test_product_list)

        self.navigate_to_product_list_screen()
        
        assert_that(self.screen_product_list(), contains(*test_product_list))
        
if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(ProductListTests)
    unittest.TextTestRunner(verbosity=2).run(suite)
