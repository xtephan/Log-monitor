require 'GUI'
require 'find'
require 'Snort'

begin
	require 'inotify'
rescue LoadError
	abort("inotify not found! Please install it!")
end


class Watcher
  
  # Initiate monitoring a snort file
  # Please see the class diagram for 
  # ...the new class design
  def init_snort(filename)
    
    @@snort=Snort.new
    @@snort.set_file(filename)
    @@snort.first_tail()
    @@snort.set_alert_gui(@@gui)
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

  
   
  # Waits for the file to be modify
  # ...and raises and event
  # ...based on Linux Kernel Inofity library
  def run
    
    i = Inotify.new
    
    #Thread each event
    t = Thread.new do
      i.each_event do |ev|
        #p ev
        #p ev.name
        #p ev.mask
        @@snort.log_moddified
        #puts "ev"
      end
    end
    
    i.add_watch(@@snort.get_filepath(), Inotify::MODIFY)
    
    t.join
    
  end
  
end