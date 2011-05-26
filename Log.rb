class Log
  
  def initialize()
    @@old_tail=""
  end
  
  def set_file(filename)
    @@filepath=filename
  end
  
  
  # find the possition of the EOF
  # ... it will be used to compare later 
  # ... for new entries
  def initial_eof()
    
    @@last_eof=0
    
    @@file=File.open(@@filepath,"r")
    @@last_eof=get_current_eof()
    
  end
  
  def get_last_eof()
    return @@last_eof
  end
  
  
  def new_entry()
    
    @@current_eof = get_current_eof()
    
    return false if @@last_eof == @@current_eof
    
    # this shall be deleted from here!!
    @@last_eof=@@current_eof
    return true
  
  end
  
  def get_current_eof()
    
    @@file.seek(0,IO::SEEK_END);
    return @@file.pos
    
  end
  
#-----------------------------------------------------------------  
  
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