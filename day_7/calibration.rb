class Calibration
  ADD = :+
  MULTIPLY = :*

  def initialize(values)
    @values = values
  end

  def possible_calibration?(target)
    duped_values = @values.dup
    check_possible_calibration(duped_values, target, duped_values.shift)
  end

  private

  def check_possible_calibration(remaining_values, target, running_total)
    remaining_values = remaining_values.dup
    current_value = remaining_values.shift
    return target == running_total if current_value.nil?
    return false if running_total > target

    return true if check_possible_calibration(remaining_values, target, running_total * current_value)
    return true if check_possible_calibration(remaining_values, target, running_total + current_value)
    
    concatenation_total = (running_total.to_s + current_value.to_s).to_i
    check_possible_calibration(remaining_values, target, concatenation_total)
  end
end
