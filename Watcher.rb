require 'inotify'
require 'find'

class Watcher
  
  attr_accessor :filename #name of the log file
  
  
  # Construct the class
  def initialize(filename)
    @filename = filename
  end

  
  # Dummy function used for testing porpuses only
  def test
    puts "In the class, other file"
    puts filename
  end

  
  
  # Waits for the file to be modify
  # and raises and event
  # based on Linux Inofity library
  def run
    
    i = Inotify.new
    
    #Thread each event
    t = Thread.new do        
      i.each_event do |ev|
        #p ev.name
        #p ev.mask
        puts "event"
      end
    end
    
    i.add_watch(filename, Inotify::MODIFY)
    
    t.join
    
  end
  
  
  
  
end