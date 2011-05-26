require 'GUI'
require 'find'
require 'Snort'


class Watcher
  
  # Initiate monitoring a snort file
  # Please see the class diagram for 
  # ...the new class design
  def init_snort(filename)
    
    @@snort=Snort.new
    
    @@snort.set_file(      filename )
    @@snort.set_alert_gui( @@gui    )
    @@snort.initial_eof()
    
  end
  
  #Dummy. Testing porpuses only
  def r5
    return 5
  end

  
  # Construct the class
  def initialize()
    @@gui=GUI.new
  end

  
  # Dummy function used for testing porpuses only
  def power_on_self_test
    puts "In the class, other file"
    @@gui.power_on_self_test
  end

  
  # Replacement for Inotify
  # ...based on comparation the current
  #...File EOF with the last known EOF 
  def run
    
    #Infinite loop.
    #..will be changed as soon as a pause botton 
    #...is implemented
    while true do
      
      if @@snort.new_entry()
        @@snort.log_moddified()
      else
        puts "same shit, different log"
      end
      
      sleep 2
    end
    
  end


end