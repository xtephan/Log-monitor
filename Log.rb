class Log
  
  def initialize()
    @@old_tail=""
  end
  
  def set_file(filename)
    @@filepath=filename
  end
  
  # Reads the last lines of a log file
  # ...and returns it as an array
  def tail(file,nr,sep)
    return %x[tail -n #{nr} #{file}].split(/#{sep}/)
  end
  
  # Find out what is new in the log file
  def get_difference(tail1, tail2)
      return tail1-tail2
  end
  
  
  
  def set_alert_gui(tmp)
    @@gui=tmp
  end
  
  
  
  def display(title,text)
    puts "\nFound change:"
    puts text
    puts "End of Found change\n"
    
    @@gui.alert(title,text)
  end
  
end