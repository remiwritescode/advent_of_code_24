require_relative 'tower'

class RadioMap
  NO_TOWER = '.'

  def initialize(tower_map)
    @raw_input = tower_map
    @antinodes = Set.new
    @towers = Hash.new { |h, k| h[k] = [] }
    set_bounds!
    parse_input!
  end

  def antinode_count
    @antinodes.size
  end

  def antinode_map
    base_map = []
    @max_y.times { base_map << ['.'] * @max_x }
    
    @antinodes.each do |(x, y)|
      base_map[y][x] = '#'
    end

    @towers.each do |frequency, towers|
      towers.each do |tower|
        x, y = tower.coordinate
        base_map[y][x] = frequency
      end
    end

    base_map.reduce("") do |memo, row|
      memo + row.join("") + "\n"
    end
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
      add_antinodes(new_tower, existing_tower)
      add_antinodes(existing_tower, new_tower)
    end
  end

  def add_antinodes(new_tower, existing_tower)
    new_tower.antinodes_to(existing_tower) do |coordinate|
      x, y = coordinate
      break unless x >= 0 && x < @max_x && y >= 0 && y < @max_y
      @antinodes << coordinate
    end
  end
end
