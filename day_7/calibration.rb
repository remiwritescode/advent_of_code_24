class Calibration
  ADD = :+
  MULTIPLY = :*

  def initialize(values)
    @values = values
  end

  def possible_calibration?(target)
    possible_signs.any? do |sign_permutation|
      calibration_value(sign_permutation) == target
    end
  end

  private

  def possible_signs
    signs = [[ADD], [MULTIPLY]]
    while signs.length < (@values.length - 1) * 2
      signs = signs.each_with_object([]) do |sign_array, memo|
        [ADD, MULTIPLY].each do |new_sign|
          memo << sign_array + [new_sign]
        end
      end
    end
    return signs
  end

  def calibration_value(signs)
    total = @values.first
    signs.each_with_index do |current_sign, idx|
      if current_sign == ADD
        total += @values[idx + 1]
      else
        total *= @values[idx + 1]
      end
    end

    total
  end
end
