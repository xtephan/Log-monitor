file = File.open("/var/log/snort/alert", "rb")
contents = file.read.split(/\n/)

puts contents[0]

contents.each do
  |line| 
  if line[0,4] == "[**]" and
      line != "[**] [1:100000160:2] COMMUNITY SIP TCP/IP message flooding directed to SIP proxy [**]"
    puts line + "\n"
  end
end