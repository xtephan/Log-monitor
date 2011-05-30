'''
Created on May 30, 2011

@author: xtephan
'''
from Log import Log

SEEK_BEGIN=0
SEEK_END=2


class Snort(Log):
    '''
    classdocs
    '''


    def __init__(self):
        '''
        Constructor
        '''
    
    def log_difference(self):
        
        print "new log"
        
        self.file.seek(self.last_eof,SEEK_BEGIN)
        
        for line in self.file:
            print line
        
        self.last_eof=self.current_eof