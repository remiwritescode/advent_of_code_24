class Multiplier
  VALID_COMMANDS_REGEX = /(mul\(\d+,\d+\))/
  COMMAND_PARSING_REGEX = /mul\((?<number_a>\d+),(?<number_b>\d+)\)/

  def initialize(input)
    @raw_input = input
  end

  def sum
    parsed_commands.sum do |parsed_command|
      a, b = parsed_command.match(COMMAND_PARSING_REGEX).captures.map(&:to_i)
      a * b
    end
  end

  private

  def parsed_commands
    return @parsed_commands if defined?(@parsed_commands)
    @parsed_commands = []

    temp_input = @raw_input.dup

    while temp_input.match?(VALID_COMMANDS_REGEX)
      match = temp_input.match(VALID_COMMANDS_REGEX)[0]
      @parsed_commands << match
      temp_input = temp_input.sub(match, '')
    end

    @parsed_commands
  end
end
