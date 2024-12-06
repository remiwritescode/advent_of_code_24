require_relative 'patrol_tracker'

input = File.read('input.txt')

tracker = PatrolTracker.new(input)
tracker.simulate!
p tracker.entered_cell_count
