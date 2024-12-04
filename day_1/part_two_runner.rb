require_relative 'location_computer'
full_input = File.read('input.txt')

puts LocationComputer.new(full_input).summed_similarity_score
