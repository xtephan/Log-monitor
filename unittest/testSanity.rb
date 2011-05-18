require 'test/unit'

class SanityTesting < Test::Unit::TestCase
  
  def test_pass
    assert(true,"Assertion was false")
    assert(true,"Assertion was true")
    assert_equal(4,2+2)
    assert_not_equal(5,2+2)
  end

end