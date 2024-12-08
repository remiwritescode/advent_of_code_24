class Calibration
  ADD = :+
  MULTIPLY = :*

  def initialize(values)
    @values = values
    initialize_signs
  end

  def possible_calibration?(target)
    initialize_signs
    i = @signs.length - 1
    while i >= 0
      return true if current_calibration == target
      
      swap_sign(i)
      swap_sign(right_most_multiply) if current_calibration > target
      i -= 1
    end

    return current_calibration == target
  end

  private

  def right_most_multiply
    found_index = nil
    @signs.each_with_index do |sign, idx|
      found_index = idx if sign == MULTIPLY
    end
    found_index
  end

  def current_calibration
    total = @values.first
    @signs.each_with_index do |current_sign, idx|
      if current_sign == ADD
        total += @values[idx + 1]
      else
        total *= @values[idx + 1]
      end
    end

    total
  end

  def swap_sign(position)
    return if position.nil?
    @signs[position] = @signs[position] == ADD ? MULTIPLY : ADD
  end

  def initialize_signs
    @signs = [ADD] * (@values.length - 1)
  end
end
