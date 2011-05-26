require 'date'

begin 
	require 'rubygems'
rescue LoadError
	abort("rubygems not found! Please install it!")
end

begin 
	require 'libnotify'
rescue LoadError
	abort("libnotify not found! Please install it!")
end


class GUI

  def power_on_self_test
    puts "Hello GUI"
    
    Libnotify.show :summary => "#{Date.today}", :body => "Happy #{Date::DAYNAMES[Date.today.wday]}!"
  end
  
  
  def alert(thisTitle,thisMessage)
    Libnotify.show :summary => "#{thisTitle}", :body => "#{thisMessage}"
    
  end
  
end