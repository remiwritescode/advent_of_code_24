require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'print_run'

class PrintRun < Minitest::Test
  def corrected_print_run
    PrintRun.correct(@print_run_pages, @rules)
  end

  def test_it_can_correct_a_trivial_print_run
    @print_run_pages = [1, 2]
    @rules = [[2, 1]]

    assert_equal [2, 1], corrected_print_run.pages
  end

  def test_it_can_handle_unneccesary_rules
    skip
    @print_run_pages = [1, 2]
    @rules = [[2, 1], [1, 3], [2, 7]]

    assert_equal [2, 1], corrected_print_run.pages
  end

  def test_it_can_return_the_middle_page_of_a_print_run
    skip
    @print_run_pages = [61, 13, 29]
    @rules = [
      [61,29],
      [61,13],
      [29,13]
    ]

    assert_equal 29, corrected_print_run.middle_page
  end

  def test_it_can_tell_if_the_original_print_ordering_was_valid
    skip
    @rules = [
      [61,29],
      [61,13],
      [29,13]
    ]

    @print_run_pages = [61, 13, 29]
    assert corrected_print_run.required_correction?

    @print_run_pages = [61, 29, 13]
    refute corrected_print_run.required_correction?
  end
end