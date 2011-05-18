require 'Watcher'

puts "i am main! Obey me!"

aw = Watcher.new

aw.power_on_self_test

aw.init_snort("/var/log/snort/alert")

#aw.run

#g = GUI.new

#g.power_on_self_test