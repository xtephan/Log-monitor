require 'Log'

class Snort<Log
  
  def get_filepath
    return @@filepath
  end
  
#-----------------------------------------------  
  def first_tail()
    @@old_tail=tail_snort(3)
  end
  
  #Tail costumisez for snort
  def tail_snort(nr_entr)
    return tail(@@snort_file,nr_entr*7,"\n\n")
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
    aux = strx.scan(/\[Classification\: ([a-zA-Z\s]+)\] \[Priority\: (\d+)\]/)
    
    if aux == [] #the case in Later Edit
      return [nil, strx.scan(/\[Priority\: (\d+)\]/)[0][0] ]
    else
      return aux[0]
    end
    
  end
  
  
  def log_moddified
      new_tail = tail_snort(3)
      
      # For unkown (yet) reasons
      # ...the event is called twice sometimes
      # ...this is an work-around
      if @@old_tail == new_tail
        return
      end
      
      tmp = get_difference(new_tail, @@old_tail)
  
      tmp2=tmp[0].split(/\n/)
      
      alert_msg=get_snort_title(tmp2[0])
      
      alert_clasif=get_snort_clasif(tmp2[1])
      
      #puts "msg"
      #puts alert_msg
      
      display_msg = "+#{alert_msg}\n+#{alert_clasif[0]}\n+Priority: #{alert_msg[1]}"
      
      display("Snort Alert", display_msg)
      
      @@old_tail = new_tail
      
    end
  
end