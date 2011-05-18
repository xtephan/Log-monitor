require 'Watcher'


puts "i am main! Obey me!"

aw = Watcher.new("/tmp/dummy")


aw.power_on_self_test
aw.run

#g = GUI.new

#g.power_on_self_test