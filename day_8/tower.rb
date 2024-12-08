class Tower
  attr_reader :frequency

  def initialize(frequency, x, y)
    @frequency = frequency
    @x = x
    @y = y
  end

  def coordinate
    [@x, @y]
  end

  def antinodes_to(other_tower)
    other_x, other_y = other_tower.coordinate

    delta_x = @x - other_x
    delta_y = @y - other_y

    antinode_x = @x
    antinode_y = @y
  
    loop do
      yield [antinode_x, antinode_y]
      antinode_x += delta_x
      antinode_y += delta_y
    end
  end
end
