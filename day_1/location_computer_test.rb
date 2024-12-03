require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'list_deltas'

class LocationComputer << Minitest::Test	
	def test_that_it_can_compute_a_trivial_delta
		test_input = """
		1   3
		"""
		
		result = LocationComputer.compute_location(test_input)
		
		assert_equal(result, 2)
	end

	def test_that_it_can_compute_a_delta_from_multiple_unsorted_locations
		test_input = """
		1   5
		4	3
		"""
		
		result = LocationComputer.compute_location(test_input)
		
		assert_equal(result, 3)
	end
end