require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'patrol_tracker'

class PatrolTrackerTest < Minitest::Test
  def entered_cell_count
    tracker = PatrolTracker.new(@initial_grid_input)
    tracker.simulate!

    tracker.entered_cell_count
  end

  def test_it_can_track_a_simple_grid
    @initial_grid_input = ".\n.\n^"

    assert_equal 3, entered_cell_count
  end

  def test_it_can_handle_an_obstruction
    @initial_grid_input = "#..\n...\n^.."
    # #..
    # ...
    # ^..

    assert_equal 4, entered_cell_count
  end

  def test_it_raises_if_a_guard_is_in_a_loop
    @initial_grid_input = ".#..\n...#\n#^..\n..#."
    # .#..
    # ...#
    # #^..
    # ..#.
    
    assert_raises(PatrolTracker::GuardInLoopError) { entered_cell_count }
  end
end
