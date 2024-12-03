require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'location_computer'

class LocationComputerTest < Minitest::Test	
	def test_that_it_can_compute_a_trivial_delta
		test_input = """
		1   3
		"""
		
		result = LocationComputer.compute_location(test_input)
		
		assert_equal 2, result
	end

	def test_that_it_can_compute_a_delta_from_multiple_unsorted_locations
		test_input = """
		1   5
		4	3
		"""
		
		result = LocationComputer.compute_location(test_input)
		
		assert_equal 3, result
	end

	def test_that_it_can_solve_the_advent_of_code_provided_example
		test_input = """
		3   4
		4   3
		2   5
		1   3
		3   9
		3   3
		"""

		result = LocationComputer.compute_location(test_input)

		assert_equal 11, result
	end
end