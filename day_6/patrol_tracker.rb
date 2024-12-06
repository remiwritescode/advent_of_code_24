require_relative 'guard'
require_relative 'cell'

class PatrolTracker
  attr_reader :grid, :cells, :guard

  def initialize(initial_grid_input)
    @simulated = false
    parse_grid_input(initial_grid_input)
  end

  def simulate!
    while guard_in_grid?
      if guard_facing_obstacle?
        guard.encounter_obstacle!
      else
        guard.advance!
        get_cell(*guard.position)&.guard_entered!
      end
    end
  end

  def entered_cell_count
    count = 0
    cells.each do |cell|
      count += 1 if cell.guard_entered?
    end
    return count
  end

  private

  def parse_grid_input(initial_grid_input)
    @grid = []
    @cells = []
    
    initial_grid_input.split("\n").each_with_index do |row, y|
      mapped_row = []
      row.split("").each_with_index do |cell, x|
        cell_object =  Cell.new(cell == '#')
        if cell == '^'
          @guard = Guard.new(x, y)
          cell_object.guard_entered!
        end

        @cells << cell_object
        mapped_row << cell_object
      end

      @grid << mapped_row
    end
  end

  def guard_in_grid?
    !!get_cell(*guard.position)
  end

  def guard_facing_obstacle?
    cell = get_cell(*guard.next_position)

    !!cell&.obstruction?
  end

  def get_cell(x, y)
    row = @grid[y]
    return row[x] if row
  end
end
