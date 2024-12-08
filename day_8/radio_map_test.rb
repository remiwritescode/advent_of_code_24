require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative 'radio_map'

class RadioMapTest < Minitest::Test
  def antinode_count
    map = RadioMap.new(@tower_map)
    map.antinode_count
  end

  def print_debug_map
    map = RadioMap.new(@tower_map)
    puts map.antinode_map
  end

  def test_it_can_determine_a_trivial_antinode_count
    @tower_map = ".aa."

    assert_equal 4, antinode_count
  end

  def test_it_can_determine_a_vertical_antinode
    @tower_map = ".aa.".split('').join("\n")

    assert_equal 4, antinode_count
  end

  def test_it_does_not_count_antinodes_that_fall_out_of_bounds
    @tower_map = ".aa"

    assert_equal 3, antinode_count
  end

  def test_it_can_calculate_multiple_antinodes
    @tower_map = "....\n.OO.\n.OO.\n...."
    # ....
    # .OO.
    # .OO.
    # ....

    assert_equal 16, antinode_count
  end

  def test_it_can_calculate_antinodes_from_multiple_frequencies
    @tower_map = "....\n.:3.\n.:3.\n...."
    # ....
    # .:3.
    # .:3.
    # ....

    assert_equal 8, antinode_count
  end

  def test_it_ignores_single_towers
    @tower_map = ".a."

    assert_equal 0, antinode_count
  end

  def test_it_calcultes_all_antinodes_for_a_tower
    @tower_map = "...aa.."

    assert_equal 7, antinode_count
  end

  def test_it_can_calculate_the_example_input
    @tower_map = File.read('example_input.txt')

    assert_equal 34, antinode_count
  end
end
