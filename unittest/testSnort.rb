require 'test/unit'
require 'Snort'

class SnortTesting < Test::Unit::TestCase
  
  def setup
    @sn = Snort.new
  end
  
  def test_sanity
    assert(true,"Assertion was false")
  end
  
  def test_init
    @sn.set_file("generic")
    assert_equal("generic",@sn.get_filepath)
    @sn.set_file("/var/log/snort/alert")
    assert_equal("/var/log/snort/alert",@sn.get_filepath)
  end
  
end