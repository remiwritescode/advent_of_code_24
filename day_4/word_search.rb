class WordSearch
  VALID_ORIENTATIONS = [
    [1, 0],   # RIGHT
    [1, 1],   # DOWN_RIGHT
    [0, 1],   # DOWN
    [-1, 1],  # DOWN LEFT
    [-1, 0],  # LEFT
    [-1, -1], # UP LEFT
    [0, -1],  # UP
    [1, -1]   # UP RIGHT
  ]

  WORD = 'XMAS'

  def initialize(input)
    @raw_input = input
    @parsed_input = parse_input
  end

  def word_count
    count = 0
    @parsed_input.each_with_index do |row, y|
      row.each_with_index do |letter, x|
        if letter == 'X'
          count += count_words_from_origin(x, y)
        end
      end
    end
    
    return count
  end
  
  private

  def parse_input
    @raw_input.split("\n").map do |row|
      row.split ''
    end
  end

  def count_words_from_origin(x, y)
    VALID_ORIENTATIONS.count do |(x_offset, y_offset)|
      valid_word?(x, y, x_offset, y_offset)
    end
  end

  def valid_word?(x, y, x_offset, y_offset)
    WORD.split('').each_with_index do |target_letter, idx|
      current_x = x + (x_offset * idx)
      current_y = y + (y_offset * idx)

      return false if current_x < 0 || current_y < 0
      return false if current_y >= @parsed_input.length
      return false if current_x >= @parsed_input[current_y].length
      return false unless @parsed_input[current_y][current_x] == target_letter
    end

    return true
  end
end
