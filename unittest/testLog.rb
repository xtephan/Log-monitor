require 'test/unit'
require 'Log'

class LogTesting < Test::Unit::TestCase
  
  def setup
    @lg = Log.new
  end
  
  def test_sanity
    assert(true,"Assertion was false")
  end
  
  def test_difference
    assert_equal([9],@lg.get_difference([2,3,4,9],[2,3,4]))
    assert_equal([],@lg.get_difference([2,3,4],[2,3,4]))
    assert_equal([0,7,8],@lg.get_difference([2,3,4,0,7,8],[2,3,4]))
  end
  
end