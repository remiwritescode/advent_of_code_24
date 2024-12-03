require_relative 'location_computer'
full_input = File.read('list_input.txt')

puts LocationComputer.compute_location(full_input)
