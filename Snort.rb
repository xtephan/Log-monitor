require 'Log'

class Snort<Log
  
  def get_filepath
    return @@filepath
  end
  
  # function trigered when the log file is modified
  def log_moddified
    
    puts "new log"
    
    tmp=get_difference()

    tmp.each { |entry| 
      puts "xxx" + entry
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
  
#-----------------------------------------------  
# everything behoind this point is comment
=begin

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
    aux = strx.scan(/\[Classification\: ([a-zA-Z\s]+)\] \[Priority\: (\d+)\]/)
    
    if aux == [] #the case in Later Edit
      return [nil, strx.scan(/\[Priority\: (\d+)\]/)[0][0] ]
    else
      return aux[0]
    end
    
  end

=end
end