require 'GUI'
require 'inotify'
require 'find'

class Watcher
  
  # Initiate monitoring a snort file
  #def init_snort(filename)
    
  #end
  
  def r5
    return 5
  end
  
  
  
  #attr_accessor :filename #name of the log file
  
  
  # Reads the last 20 lines of the log file
  # ...and returns it as an array
  def tail
    
    tmp = %x[tail -n 20 /tmp/dummy].split(/\n/)
    
    return tmp
  end
  
  # Construct the class
  def initialize()
    #@filename = filename
    #@@old_tail = tail
    #@@gui=GUI.new
  end

  
  # Dummy function used for testing porpuses only
  def power_on_self_test
    puts "In the class, other file"
    #puts filename
    #puts @@old_tail
    #@@gui.power_on_self_test
  end

  
  def get_difference(tail1, tail2)
    return tail1-tail2
  end
  
  
  # Function calles when something is modified
  # ...on a log file
  def log_moddified
    new_tail = tail
    
=begin
    puts "###old###" 
    puts @@old_tail
    
    puts "###new###" 
    puts new_tail
=end

      
    # For unkown (yet) reasons
    # ...the event is called twice sometimes
    # ...this is an work-around    
    if @@old_tail == new_tail
      return
    end
    
    tmp = get_difference(new_tail, @@old_tail)

    display(tmp)
    
    @@old_tail = new_tail
    
  end
  
  # Display a text on the output
  def display(text)
    puts "\nFound change:"
    puts text
    puts "End of Found change\n"
    
    @@gui.alert(text)
  
  end
  
  # Waits for the file to be modify
  # ...and raises and event
  # ...based on Linux Inofity library
  def run
    
    i = Inotify.new
    
    #Thread each event
    t = Thread.new do        
      i.each_event do |ev|
        #p ev
        #p ev.name
        #p ev.mask
        log_moddified
        #puts "ev"
      end
    end
    
    i.add_watch(filename, Inotify::MODIFY)
    
    t.join
    
  end
  
end