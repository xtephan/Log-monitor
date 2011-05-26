require 'test/unit'
require 'Log'

class LogTesting < Test::Unit::TestCase
  
  def setup
    @lg = Log.new
  end
  
  def test_sanity
    assert(true,"Assertion was false")
  end
  
end