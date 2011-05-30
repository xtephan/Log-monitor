'''
Created on May 30, 2011

@author: xtephan
'''
from Log import Log

SEEK_BEGIN=0
SEEK_END=2


class Snort(Log):
    '''
    Class that process the Snort Log Files
    '''

    def __init__(self):
        '''
        Constructor
        '''
    
    # Parses the raw entries to the display form
    def parse_for_display(self,ne):
        
        thisDisplayMsg=[]
        
        for thisEntry in ne:
            
            line=thisEntry.splitlines()
            
        
        return thisDisplayMsg
        
        
    # Returns the new entries in the log
    # ready for display 
    def log_difference(self):
        
        print "new log"
        
        self.file.seek(self.last_eof,SEEK_BEGIN)
        
        new_entries=[]

        ent=""        
        for line in self.file:
            if line == "\n":
                new_entries.append(ent)
                ent=""
            else:
                ent= (ent+line if ent!="" else line)
                
        display = self.parse_for_display(new_entries)
        
        print display
        
        self.last_eof=self.current_eof
        
        return 0