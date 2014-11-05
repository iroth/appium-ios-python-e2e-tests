"""
under-test Product List E2E Test
"""
from hamcrest import *
import unittest
import os
from random import randint
from appium import webdriver
from time import sleep

class ProductListTests(unittest.TestCase):

    def setUp(self):
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

    def tearDown(self):
        self.driver.quit()

#    def _given_a_store_with_products():
#        return

    def navigate_to_product_list_screen(self):
        return
    
    def screen_product_list(self):
#        cells = self.driver.find_element_by_accessibility_id('ProductList').elements()
        cells = self.driver.find_elements_by_xpath('//UIACollectionView/UIACollectionCell/UIAStaticText')

#        cells = self.driver.find_elements_by_ios_uiautomation('collectionViews[0].cells()')
        product_names = map(lambda c: c.text, cells)
        return product_names
    
    def test_product_list_populated(self):
        
#        _given_a_store_with_products("p1", "p2")

        self.navigate_to_product_list_screen()
        
        assert_that(self.screen_product_list(), contains("p1", "p2"))
        
if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(ProductListTests)
    unittest.TextTestRunner(verbosity=2).run(suite)
