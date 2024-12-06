require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative 'guard'

class GuardTest < Minitest::Test
  def guard
    @guard ||= Guard.new(0, 0)
  end

  def test_she_faces_north_by_default
    assert_equal Guard::NORTH, guard.orientation
  end

  def test_she_cycles_all_directions
    guard.encounter_obstacle!
    
    assert_equal Guard::EAST, guard.orientation

    guard.encounter_obstacle!

    assert_equal Guard::SOUTH, guard.orientation

    guard.encounter_obstacle!

    assert_equal Guard::WEST, guard.orientation

    guard.encounter_obstacle!

    assert_equal Guard::NORTH, guard.orientation
  end

  def test_she_knows_her_next_position
    assert_equal [0, 1], guard.next_position
  end
  
  def test_that_she_can_advance
    guard.advance!

    assert_equal [0, 1], guard.position
  end

  def test_that_she_can_walk_in_a_circle
    guard.advance!
    guard.encounter_obstacle!
    guard.advance!

    assert_equal [1, 1], guard.position

    guard.encounter_obstacle!
    guard.advance!

    assert_equal [1, 0], guard.position

    guard.encounter_obstacle!
    guard.advance!

    assert_equal [0, 0], guard.position
  end
end
