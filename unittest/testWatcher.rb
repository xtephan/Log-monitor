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
    assert_equal(["Misc activity","2"], @wc.get_snort_clasif("[Classification: Misc activity] [Priority: 2]"))
    
  end
  
  
end