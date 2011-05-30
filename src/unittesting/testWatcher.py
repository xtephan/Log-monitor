'''
Created on May 30, 2011

@author: xtephan
'''
import unittest
from sources import Watcher


class Test(unittest.TestCase):


    def setUp(self):
        self.wc=Watcher.Watcher()
        pass


    def tearDown(self):
        pass

    '''
    Sanity testing.. debugging  porpuses only
    '''
    def testSanity(self):
        self.assertEqual(4,2+2)
        self.assertTrue(1)
        pass
    
    def testr5(self):
        self.assertEqual(self.wc.r5(),5)
        pass



if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testSanity']
    unittest.main()