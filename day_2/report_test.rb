require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'report'

class ReportTest < Minitest::Test
  def safe_report?(error_tolerance: 0)
    Report.new(@report_data).safe?(error_tolerance)
  end
  
  def test_a_trivial_increasing_report_is_safe
    @report_data = "1 2 3 4"

    assert safe_report?
  end

  def test_a_trivial_decreasing_report_is_safe
    @report_data = "5 4 3 2 1"

    assert safe_report?
  end

  def test_a_report_with_increasing_and_decreasing_values_is_unsafe
    @report_data = "1 2 3 2 1"

    refute safe_report?
  end

  def test_a_report_with_an_excessive_delta_is_unsafe
    @report_data = "1 2 6 7 8"

    refute safe_report?
  end

  def test_a_report_with_a_zero_delta_is_unsafe
    @report_data = "1 2 3 3 4"

    refute safe_report?
  end

  def test_a_safety_threshold_can_be_provided_to_allow_for_errors
    @report_data = "1 2 3 3 4"

    assert safe_report?(error_tolerance: 1)
  end
end
