require_relative 'calibration'

inputs = File.readlines('input.txt')

total = 0
inputs.each do |calibration_line|
  target, inputs = calibration_line.split(":")
  parsed_target = target.to_i
  parsed_inputs = inputs.split(' ').map(&:to_i)

  if Calibration.new(parsed_inputs).possible_calibration?(parsed_target)
    puts parsed_target
    total += parsed_target
  end
end

puts total
