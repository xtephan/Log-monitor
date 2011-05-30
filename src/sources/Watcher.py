'''
Created on May 30, 2011

@author: xtephan
'''

from Snort import Snort
from GUI import GUI

from time import sleep

class Watcher():
    '''
    Class that handles monitoring on all
    the log files
    '''


    def __init__(self):
        '''
        Constructor
        '''
        self.__gui=GUI()
        
    def r5(self):
        return 5
    
    # Initiate monitoring a snort file
    def init_snort(self,filename):
        
        self.snort = Snort()
        self.snort.set_file(filename)
        self.snort.initial_eof()
        
        
    # Replacement for Inotify
    # ..based on comparison between
    # ..the current EOF and the last known one    
    def run(self):
        
        #Infinite loop
        #..will be changed soon
        
        while True:
            
            if self.snort.new_entry():
                diff = self.snort.log_difference()
                print diff
            else:
                print "same shit, different loop"
            
            sleep(2)
    
    
        
        