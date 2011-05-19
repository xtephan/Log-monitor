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
  
  def test_snort_log_title
    #assert_equal("test1",@wc.get_snort_title("[**] [1:100000160:2] test1 [**]"))
    
    assert_equal("COMMUNITY SIP TCPIP message flooding directed to SIP proxy", @wc.get_snort_title("[**] [1:100000160:2] COMMUNITY SIP TCPIP message flooding directed to SIP proxy [**]"))
    
  end
  
  
  # I feel Leet haxor
  # .. i can write regex
  # ..muhahahah.. The end is near!!
  def test_snort_classif
    assert_equal(["Attempted Denial of Service","2"], @wc.get_snort_clasif("[Classification: Attempted Denial of Service] [Priority: 2]"))
    assert_equal(["Attempted Denial of Service","25"], @wc.get_snort_clasif("[Classification: Attempted Denial of Service] [Priority: 25]"))
    
  end
  
  
end