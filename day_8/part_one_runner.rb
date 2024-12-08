require_relative 'radio_map'

input = File.read('input.txt')

p RadioMap.new(input).antinode_count
