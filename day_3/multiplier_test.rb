require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'multiplier'

class MultiplierTest < Minitest::Test
  def result
    Multiplier.new(@input_code).sum
  end

  def test_it_handles_a_trivial_input
    @input_code = "mul(1,1)"

    assert_equal 1, result
  end

  def test_it_ignores_garbage_on_a_trivial_input
    @input_code = "foomul(1,1)barbaz-1+@"

    assert_equal 1, result
  end

  def test_it_can_handle_multiple_instructions
    @input_code = "mul(1,1)helloworld!mul(4,3)"

    assert_equal 13, result
  end

  def test_it_can_handle_duplicate_instructions
    @input_code = "mul(8,4)mul(8,4)"

    assert_equal 64, result
  end
end
