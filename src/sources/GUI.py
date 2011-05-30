'''
Created on May 30, 2011

@author: xtephan
'''

import pygtk
pygtk.require('2.0')
import pynotify
import sys

class GUI():
    '''
   This class will handle all the GUI shit
    '''


    def __init__(self):
        '''
        Constructor
        '''
    def power_on_self_test(self):
        n = pynotify.Notification("Summary", "This is some sample content")
        n.show()
        