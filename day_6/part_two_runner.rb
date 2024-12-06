require_relative 'patrol_tracker'

input = File.read('input.txt')

spinner_states = %w(| / - \\)

i = 0
progress_string = ""
valid_loop_placement_counts = 0
while i < input.length
  if input[i] == '.'
    input[i] = '#'
    begin
      PatrolTracker.new(input).simulate!
    rescue PatrolTracker::GuardInLoopError
      valid_loop_placement_counts += 1
    end
    input[i] = '.'
  end
  print "\b" * progress_string.length
  progress_string = "#{spinner_states[i % spinner_states.length]} #{i}/#{input.length}"
  print progress_string
  i += 1
end

p valid_loop_placement_counts
