f= File.open("/home/xtephan/f1","r")
g= File.open("/home/xtephan/f2","r")

#f.each { |line| puts line }

f.seek(0,IO::SEEK_END)
puts f.pos
  
g.seek(27,IO::SEEK_CUR)    
g.each { |line| puts line }