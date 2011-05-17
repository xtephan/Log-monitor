require 'Watcher'

puts "i am main! Obey me!"

aw = Watcher.new("/tmp/dummy")

aw.test

aw.run