require 'Log'

class Snort<Log
  
  def get_filepath
    return @@filepath
  end
  
  
  # Analyse a log entry
  # ..parse it and alert
  def analysis( entry )
    
    lines=entry.split(/\n/)
    
    alert_msg    = get_snort_title(     lines[0] )
    alert_clasif = get_snort_clasif(    lines[1] )
    alert_scip   = get_snort_source_ip( lines[2] )
      
    display_msg = "+ #{alert_msg}\n"
    display_msg+= "+ #{alert_clasif[0]}\n" if alert_clasif[0]
    display_msg+= "+ Priority: #{alert_clasif[1]}\n"
    display_msg+= "+ Source: #{alert_scip}\n"
      
    display_cli("Snort Alert",display_msg)
    display_gui("Snort Alert",display_msg)
      
  end
  
  
  # function trigered when the log file is modified
  def log_moddified
    
    tmp=get_difference()

    if tmp.size > 10
      display_cli("Snort Alert","Multiple snort log entries. Please see the log file")
      display_gui("Snort Alert","Multiple snort log entries. Please see the log file")
      return 
    end
    
    tmp.each { |entry| 
      analysis( entry)
    }
    
  end
  
  # Returns an array constisting of
  # ... the new entries in the log file
  def get_difference()
    
    aux=[]
    inc=0 
    
    @@file.seek(@@last_eof,IO::SEEK_SET)
    
    @@file.each { |line| 

      if line == "\n"
        inc+=1
      else
        aux[inc] = ( aux[inc]==nil ? line : aux[inc]+=line )
      end
    
    }
      
    @@last_eof=@@current_eof
    
    return aux
    
  end
  

  # Parses a snort log  using regex
  # Pattern of the log line:
  # ..."[**] [1:100000160:2] message_of_the_title [**]"
  def get_snort_title(strx)
    #NOTE TO __SELF__
    #apperently, drinking beers and writing regexp
    #..does not go hand-in-hand
    aux = strx.scan(/\[\*\*\] [\d\:\[\]]+ ([a-zA-Z\s\/\(\)\d\>\_\:\-\.\*]+) \[\*\*\]/)
    return aux[0][0]
  end
  
    
  # Parses a snort log  using regex
  # Pattern of the log line:
  # ..."[Classification: Attempted Denial of Service] [Priority: 2]"
  # will return aux :0 => "classif_msg", :1 => "priority_no"
  #Later edit: some logs do not have classification. Nill shall be returned
  def get_snort_clasif(strx)
    
    aux = strx.scan(/\[Classification\: ([a-zA-Z\s]+)\] \[Priority\: (\d+)\] /)
    
    if aux == [] #the case in Later Edit
      return [nil, strx.scan(/\[Priority\: (\d+)\] /)[0][0] ]
    else
      return aux[0]
    end
    
  end
  
  
  # Parses a snort log  using regex
  # Pattern of the log line:
  # ..."05/24-05:18:48.990878 source_ip+port -> dest_ip+port"
  def get_snort_source_ip(strx)
    #NOTE TO __SELF__
    #apperently, drinking beers and writing regexp
    #..does not go hand-in-hand
    aux = strx.scan(/[\d\/\-\:\.]+ ([\d\.\:]+) \-\> [\d\.\:]+/)
    return aux[0][0]
  end

end