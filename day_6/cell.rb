class Cell
  def initialize(obstruction)
    @obstruction = obstruction
    @guard_entered = false
  end

  def obstruction?
    @obstruction
  end

  def guard_entered?
    @guard_entered
  end

  def initial_guard_orientation
    @guard_orientation
  end

  def guard_entered!(orientation)
    @guard_entered = true
    @guard_orientation ||= orientation
  end
end
