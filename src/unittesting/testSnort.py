'''
Created on May 30, 2011

@author: xtephan
'''
import unittest
from sources import Snort

class Test(unittest.TestCase):


    def setUp(self):
        self.sn = Snort.Snort()
        pass


    def tearDown(self):
        pass


    def testinit(self):
        self.sn.set_file("generic")
        self.assertEqual(self.sn.get_filepath(),"generic")
        self.sn.set_file("/var/log/snort/alert")
        self.assertEqual(self.sn.get_filepath(),"/var/log/snort/alert")
        pass


if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testinit']
    unittest.main()