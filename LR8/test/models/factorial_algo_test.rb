require 'test_helper'

class FactorialAlgoTest < ActiveSupport::TestCase
  test "factorial is correct" do
    assert_equal(FactorialAlgo.get_factorial(5), 120)
    assert_equal(FactorialAlgo.get_factorial(0), 1)
  end

  test "simon's hypothesis" do
    assert_equal(FactorialAlgo.check_simon_theory.size, 4)
  end
end
