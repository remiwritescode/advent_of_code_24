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

  def antinode_to(other_tower)
    other_x, other_y = other_tower.coordinate

    delta_x = @x - other_x
    delta_y = @y - other_y
  
    return [@x + delta_x, @y + delta_y]
  end
end
