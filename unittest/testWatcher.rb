require 'test/unit'
require 'Watcher'

class WatcherTesting < Test::Unit::TestCase
  
  def setup
    @wc = Watcher.new
  end
  
  def test_fail
    assert(true,"Assertion was false")
    assert_equal(5,@wc.r5)
  end

  def test_difference
    assert_equal([9],@wc.get_difference([2,3,4,9],[2,3,4]))
    assert_equal([],@wc.get_difference([2,3,4],[2,3,4]))
    assert_equal([0,7,8],@wc.get_difference([2,3,4,0,7,8],[2,3,4]))
  end
  
  
  # Morten, I am ready to admit that unittesting in THE way to do it
  # The next 2 test suits saved me a __shit__load of time
  def test_snort_log_title
    
    assert_equal("COMMUNITY SIP TCP/IP message flooding directed to SIP proxy", @wc.get_snort_title("[**] [1:100000160:2] COMMUNITY SIP TCP/IP message flooding directed to SIP proxy [**]"))
    assert_equal("SQL ping attempt", @wc.get_snort_title("[**] [1:2049:6] SQL ping attempt [**]") )
    assert_equal("(portscan) TCP Portscan", @wc.get_snort_title("[**] [122:1:0] (portscan) TCP Portscan [**]") )
    assert_equal("SNMP request tcp", @wc.get_snort_title("[**] [1:1418:11] SNMP request tcp [**]") )
    assert_equal("SNMP AgentX/tcp request", @wc.get_snort_title("[**] [1:1421:11] SNMP AgentX/tcp request [**]") )
    assert_equal("ICMP Destination Unreachable Communication with Destination Host is Administratively Prohibited", @wc.get_snort_title("[**] [1:486:4] ICMP Destination Unreachable Communication with Destination Host is Administratively Prohibited [**]") )
    assert_equal("ICMP Destination Unreachable Communication Administratively Prohibited", @wc.get_snort_title("[**] [1:485:4] ICMP Destination Unreachable Communication Administratively Prohibited [**]") )
    
    assert_equal("DDOS mstream client to handler", @wc.get_snort_title("[**] [1:249:8] DDOS mstream client to handler [**]") )
    assert_equal("SNMP trap tcp", @wc.get_snort_title("[**] [1:1420:11] SNMP trap tcp [**]") )
    assert_equal("ICMP Destination Unreachable Port Unreachable", @wc.get_snort_title("[**] [1:402:7] ICMP Destination Unreachable Port Unreachable [**]") )
    assert_equal("SNMP trap udp", @wc.get_snort_title("[**] [1:1419:9] SNMP trap udp [**]") )
    assert_equal("ICMP Packet", @wc.get_snort_title("[**] [1:477:3] ICMP Packet [**]") )
    assert_equal("(snort_decoder): Tcp Window Scale Option found with length > 14", @wc.get_snort_title("[**] [116:59:1] (snort_decoder): Tcp Window Scale Option found with length > 14 [**]") )
    assert_equal("SCAN nmap XMAS", @wc.get_snort_title("[**] [1:1228:7] SCAN nmap XMAS [**]") )
    assert_equal("RPC portmap listing TCP 111", @wc.get_snort_title("[**] [1:598:12] RPC portmap listing TCP 111 [**]") )
    assert_equal("WEB-MISC robots.txt access", @wc.get_snort_title("[**] [1:1852:3] WEB-MISC robots.txt access [**]") )
    assert_equal("(spp_ssh) Protocol mismatch", @wc.get_snort_title("[**] [128:4:1] (spp_ssh) Protocol mismatch [**]") )
    
    
  end
  
  
  # I feel Leet haxor
  # .. i can write regex
  # ..muhahahah.. The end is near!!
  def test_snort_classif
    assert_equal(["Attempted Denial of Service","2"], @wc.get_snort_clasif("[Classification: Attempted Denial of Service] [Priority: 2]"))
    assert_equal(["Attempted Denial of Service","25"], @wc.get_snort_clasif("[Classification: Attempted Denial of Service] [Priority: 25]"))
    assert_equal([nil,"3"], @wc.get_snort_clasif("[Priority: 3]"))
    assert_equal(["Misc activity","2"], @wc.get_snort_clasif("[Classification: Misc activity] [Priority: 2]"))
    assert_equal(["Attempted Information Leak","2"], @wc.get_snort_clasif("[Classification: Attempted Information Leak] [Priority: 2]"))
    assert_equal(["Decode of an RPC Query","2"], @wc.get_snort_clasif("[Classification: Decode of an RPC Query] [Priority: 2]"))
    assert_equal(["access to a potentially vulnerable web application","2"], @wc.get_snort_clasif("[Classification: access to a potentially vulnerable web application] [Priority: 2]"))
    assert_equal([nil,"0"], @wc.get_snort_clasif("[Priority: 0]"))    

  end
  
  
end