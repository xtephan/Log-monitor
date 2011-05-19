require 'rubygems'
require 'libnotify'

class GUI

  def power_on_self_test
    puts "Hello GUI"
    
    Libnotify.show :summary => "#{Date.today}", :body => "Happy #{Date::DAYNAMES[Date.today.wday]}!"
  end
  
  
  def alert(thisTitle,thisMessage)
    Libnotify.show :summary => "#{thisTitle}", :body => "#{thisMessage}"
    
  end
  
end