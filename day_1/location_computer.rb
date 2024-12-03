class LocationComputer
	attr_reader :raw_input

	def initialize(raw_input)
		@raw_input = raw_input
	end

	def self.compute_location(location_data)
		new(location_data).summed_result
	end

	# Parse the list
	
	def summed_result
		return @_summed_result if defined?(@_summed_result)
		@_summed_result = 0

		left_values, right_values = parsed_input
		
		left_values.each_with_index do |left_value, idx|
			@_summed_result += get_delta(left_value, right_values[idx])
		end
		
		return @_summed_result
	end

	def get_delta(number_a, number_b)
		difference = number_a - number_b
		difference < 0 ? difference * -1 : difference
	end

	private

	def parsed_input
		left_values = []
		right_values = []
		
		raw_input.split.each_slice(2).each do |left_value, right_value|
			left_values << left_value.to_i
			right_values << right_value.to_i
		end

		left_values.sort!
		right_values.sort!

		return [left_values, right_values]
	end
end