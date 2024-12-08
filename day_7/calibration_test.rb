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

  def test_it_can_validate_another_more_complex_calibration
    @inputs = [11, 6, 16, 20]
    @calibration_value = 292

    assert possible_calibration?
  end

  def test_it_can_fail_a_calibration_that_is_impossibly_large
    @inputs = [16, 10, 13]
    @calibration_value = 161011

    refute possible_calibration?
  end

  def test_a_weird_case_idk_exists
    # 13 * 26 * 4 + 4
    @inputs = [13, 26, 4, 4]
    @calibration_value = 1356

    assert possible_calibration?
  end

  def test_all_multiples_is_possible
    @inputs = [10, 20, 30, 40]
    @calibration_value = 240000

    assert possible_calibration?
  end

  def test_it_fails_correctly_when_value_is_impossibly_low
    @inputs = [10, 19]
    @calibration_value = 9

    refute possible_calibration?
  end

  def test_it_accurately_checks_the_sample
    inputs = {
      190 => [10, 19],
      3267 => [81, 40, 27],
      83 => [17, 5],
      156 => [15, 6],
      7290 => [6, 8, 6, 15],
      161011 => [16, 10, 13],
      192 => [17, 8, 14],
      21037 => [9, 7, 18, 13],
      292 => [11, 6, 16, 20]
    }

    total = 0
    inputs.each do |key, value|
      @calibration_value = key
      @inputs = value
      total += @calibration_value if possible_calibration?
    end

    assert_equal 3749, total
  end
end
