require 'Watcher'
require 'test/unit'

class WatcherTesting < Test::Unit::TestCase
  
  #def test_for_truth
  #  assert true
  #end
  
  def test_array_difference
    assert_equal [], Watcher.get_difference([],[])
  end

end