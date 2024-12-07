require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative 'calibration'

class CalibrationTest < Minitest::Test
  def possible_calibration?
    Calibration.new(@inputs).possible_calibration?(@calibration_value)
  end

  def test_it_can_validate_a_simple_multiplication_calibration
    @inputs = [10, 19]
    @calibration_value = 190

    assert possible_calibration?
  end

  def test_it_can_validate_a_simple_addition_calibration
    @inputs = [10, 19]
    @calibration_value = 29

    assert possible_calibration?
  end

  def test_it_can_validate_an_impossible_calibration
    @inputs = [10, 19]
    @calibration_value = 33

    refute possible_calibration?
  end

  def test_it_can_validate_a_more_complex_calibration
    @inputs = [81, 40, 27]
    @calibration_value = 3267

    assert possible_calibration?
  end
end
