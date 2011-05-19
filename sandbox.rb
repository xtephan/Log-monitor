strx="[**] [1:100000160:2] COMMUNITY SIP TCP/IP message flooding directed to SIP proxy [**]"

puts strx.scan(/\[\*\*\] [\d\:\[\]]+ ([a-zA-Z\s\/]+) \[\*\*\]/)

puts "cacat"
