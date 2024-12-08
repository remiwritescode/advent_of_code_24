require_relative 'tower'

class RadioMap
  NO_TOWER = '.'

  def initialize(tower_map)
    @raw_input = tower_map
    @antinodes = []
    @towers = Hash.new { |h, k| h[k] = [] }
    set_bounds!
    parse_input!
  end

  def antinode_count
    @antinodes.count
  end

  private

  def set_bounds!
    rows = @raw_input.split("\n")
    @max_y = rows.length
    @max_x = rows.first.length
  end

  def parse_input!
    @raw_input.split("\n").each_with_index do |row, y|
      row.split('').each_with_index do |frequency, x|
        add_tower(frequency, x, y)
      end
    end
  end

  def add_tower(frequency, x, y)
    return if frequency == NO_TOWER
    new_tower = Tower.new(frequency, x, y)
    record_valid_antinodes(new_tower)
    @towers[frequency] << new_tower
  end

  def record_valid_antinodes(new_tower)
    @towers[new_tower.frequency].each do |existing_tower|
      add_antinode(new_tower.antinode_to(existing_tower))
      add_antinode(existing_tower.antinode_to(new_tower))
    end
  end

  def add_antinode(coordinate)
    x, y = coordinate
    if x >= 0 && x < @max_x && y >= 0 && y < @max_y
      @antinodes << coordinate
    end
  end
end
