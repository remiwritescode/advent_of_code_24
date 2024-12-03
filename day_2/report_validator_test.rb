require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'report_validator'

class ReportValidatorTest < Minitest::Test
  def safe_report_count(error_tolerance: 0)
    ReportValidator.new(@reports_input.chomp).safe_count(error_tolerance)
  end

  def test_it_counts_a_single_safe_report
    @reports_input = "1 2 3"

    assert_equal 1, safe_report_count
  end

  def test_it_does_not_count_a_single_unsafe_report
    @reports_input = "1 2 7"

    assert_equal 0, safe_report_count
  end

  def test_it_counts_only_safe_reports_when_given_multiple
    @reports_input = "1 2 3\n1 2 7"

    assert_equal 1, safe_report_count
  end

  def test_it_accepts_a_configurable_error_tolerance_for_reports
    @reports_input = "1 2 3\n1 2 7"

    assert_equal 2, safe_report_count(error_tolerance: 1)
  end
end
