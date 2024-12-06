class Guard
  # Y-Axis has to be inverted because we're dealing with array indices
  NORTH = [0, -1]
  EAST = [1, 0]
  SOUTH = [0, 1]
  WEST = [-1, 0]

  ORIENTATIONS = [
    NORTH,
    EAST,
    SOUTH,
    WEST
  ]

  def initialize(x, y)
    @x = x
    @y = y
    @orientation_index = 0
  end

  def orientation
    ORIENTATIONS[@orientation_index]
  end

  def position
    [@x, @y]
  end

  def next_position
    [@x + orientation[0], @y + orientation[1]]
  end

  def encounter_obstacle!
    @orientation_index = (@orientation_index + 1) % ORIENTATIONS.length
  end

  def advance!
    @x, @y = next_position
  end
end
