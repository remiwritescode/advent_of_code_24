class Multiplier
  MUL_COMMAND_REGEX = /^mul\((?<number_a>\d+),(?<number_b>\d+)\)/
  DO_COMMAND_REGEX = /^do\(\)/
  DONT_COMMAND_REGEX = /^don\'t\(\)/

  def initialize(input)
    @raw_input = input
  end

  def sum
    parsed_commands.sum do |parsed_command|
      a, b = parsed_command.match(MUL_COMMAND_REGEX).captures.map(&:to_i)
      a * b
    end
  end

  private

  def parsed_commands
    return @parsed_commands if defined?(@parsed_commands)
    @parsed_commands = []
    
    temp_input = @raw_input.dup
    parsing_enabled = true

    while temp_input.length > 0
      if temp_input.match?(DO_COMMAND_REGEX)
        parsing_enabled = true
      elsif temp_input.match?(DONT_COMMAND_REGEX)
        parsing_enabled = false
      elsif temp_input.match?(MUL_COMMAND_REGEX) && parsing_enabled
        @parsed_commands << temp_input.match(MUL_COMMAND_REGEX)[0]
      end

      temp_input = temp_input[1..]
    end

    @parsed_commands
  end
end
