require_relative 'multiplier'

commands = File.read('input.txt')
p Multiplier.new(commands).sum
