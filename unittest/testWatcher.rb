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

 
end