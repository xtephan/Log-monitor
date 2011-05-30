'''
Created on May 30, 2011

@author: xtephan
'''

import sys

SEEK_END=2

class Log():
    '''
    Log class. This will be used to extend classes like Snort
    which will handle the actual particularities 
    '''


    def __init__(self):
        '''
        Constructor
        '''
        
    def set_file(self,filename):
        self.__filepath=filename
        
    def get_filepath(self):
        return self.__filepath
    
    
    # find the position of the EOF
    # ... it will be used to compare later 
    # ... for new entries
    def initial_eof(self):
        
        self.file=open(self.__filepath,'rb')
        self.last_eof=self.get_current_eof()
 
        
    # returns the position of the EOF
    def get_current_eof(self):
        
        self.file.seek(0,SEEK_END)
        return self.file.tell()
        
    #detects if a new entries has been added 
    #...to the log file
    def new_entry(self):
        self.current_eof = self.get_current_eof()
        
        return ( False if self.current_eof==self.last_eof else True)
    