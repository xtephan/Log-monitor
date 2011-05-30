'''
Created on May 30, 2011

@author: xtephan
'''
from Watcher import Watcher

if __name__ == '__main__':
    
    print "Hello World"
    
    wc = Watcher()

    wc.init_snort("/home/xtephan/alert")
    #wc.init_snort("/var/log/snort/alert")
  
    
    wc.run()