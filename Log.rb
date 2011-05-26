class Log
  
  def initialize()
    @@old_tail=""
  end
  
  def set_file(filename)
    @@filepath=filename
  end
  
  def set_alert_gui(tmp)
    @@gui=tmp
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
  
  
  #detects if a new entries has been added 
  #...to the log file
  def new_entry()
    
    @@current_eof = get_current_eof()
    
    return false if @@last_eof == @@current_eof
    return true
  
  end
  
  def get_current_eof()
    
    @@file.seek(0,IO::SEEK_END);
    return @@file.pos
    
  end
  
  
#-----------------------------------------------------------------  
=begin
 
  def display(title,text)
    puts "\nFound change:"
    puts text
    puts "End of Found change\n"
    
    @@gui.alert(title,text)
  end
=end
 
end