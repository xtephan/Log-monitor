require 'GUI'
require 'find'

begin
	require 'inotify'
rescue LoadError
	abort("inotify not found! Please install it!")
end



class Watcher
  
  # Initiate monitoring a snort file
  def init_snort(filename)
    @@snort_file=filename
    @@snort_ot = tail_snort(3)
    puts @@snort_ot
  end
  
  #Just dummy
  def r5
    return 5
  end
  
     
  # Reads the last lines of a log file
  # ...and returns it as an array
  def tail(file,nr,sep)
    return %x[tail -n #{nr} #{file}].split(/#{sep}/)
  end
  
  #Tail costumisez for snort
  def tail_snort(nr_entr)
    return tail(@@snort_file,nr_entr*7,"\n\n")
  end
  
  # Construct the class
  def initialize()
    @@gui=GUI.new
  end

  
  # Dummy function used for testing porpuses only
  def power_on_self_test
    puts "In the class, other file"
    #puts filename
    #puts @@old_tail
    @@gui.power_on_self_test
  end


  
  # Find out what is new in the log file
  def get_difference(tail1, tail2)
    return tail1-tail2
  end
  
  
  # Parses a snort log  using regex
  # Pattern of the log line:
  # ..."[**] [1:100000160:2] message_of_the_title [**]"
  def get_snort_title(strx)
    #NOTE TO __SELF__
    #apperently, drinking beers and writing regexp
    #..does not go hand-in-hand
    aux = strx.scan(/\[\*\*\] [\d\:\[\]]+ ([a-zA-Z\s\/\(\)\d\>\_\:\-\.]+) \[\*\*\]/)
    return aux[0][0]
  end
  
    
  # Parses a snort log  using regex
  # Pattern of the log line:
  # ..."[Classification: Attempted Denial of Service] [Priority: 2]"
  # will return aux :0 => "classif_msg", :1 => "priority_no"
  #Later edit: some logs do not have classification. Nill shall be returned
  def get_snort_clasif(strx)
    aux = strx.scan(/\[Classification\: ([a-zA-Z\s]+)\] \[Priority\: (\d+)\]/)
    
    if aux == [] #the case in Later Edit
      return [nil, strx.scan(/\[Priority\: (\d+)\]/)[0][0] ]
    else
      return aux[0]
    end
    
  end
    
  
#-------------------------------------------------------------------------
  # Function calles when something is modified
  # ...on a log file
  def log_moddified_snort
    new_tail = tail_snort(3)
    
    # For unkown (yet) reasons
    # ...the event is called twice sometimes
    # ...this is an work-around
    if @@snort_ot == new_tail
      return
    end
    
    tmp = get_difference(new_tail, @@snort_ot)

    tmp2=tmp[0].split(/\n/)
    
    alert_msg=get_snort_title(tmp2[0])
    
    alert_clasif=get_snort_clasif(tmp2[1])
    
    #puts "msg"
    #puts alert_msg
    
    display_msg = "+#{alert_msg}\n+#{alert_clasif[0]}\n+Priority: #{alert_msg[1]}"
    
    display("Snort Alert", display_msg)
    
    @@snort_ot = new_tail
    
  end
  
  # Display a text on the output
  def display(title,text)
    puts "\nFound change:"
    puts text
    puts "End of Found change\n"
    
    @@gui.alert(title,text)
  
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
        log_moddified_snort
        #puts "ev"
      end
    end
    
    i.add_watch(@@snort_file, Inotify::MODIFY)
    
    t.join
    
  end
  
end