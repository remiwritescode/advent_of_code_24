class Calibration
  ADD = :+
  MULTIPLY = :*

  def initialize(values)
    @values = values
  end

  def possible_calibration?(target)
    check_possible_calibration(@values, target)
  end

  private

  def check_possible_calibration(remaining_values, remaining_target)
    remaining_values = remaining_values.dup
    current_value = remaining_values.pop
    return current_value == remaining_target if remaining_values.length == 0
    return false if remaining_target < 0

    if remaining_target % current_value == 0
      return true if check_possible_calibration(remaining_values, remaining_target / current_value)
    end

    return check_possible_calibration(remaining_values, remaining_target - current_value)
  end
end
