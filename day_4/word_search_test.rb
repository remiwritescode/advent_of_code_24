require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'word_search'

class WordSearchTest < Minitest::Test
  def xmas_count
    WordSearch.new(@input).word_count
  end

  def test_it_can_find_a_trivial_word
    @input = "FOOXMASFOO"

    assert_equal 1, xmas_count
  end

  def test_it_can_find_a_trivial_backwards_word
    @input = "OOFSAMXOOF"

    assert_equal 1, xmas_count
  end

  def test_it_can_find_a_trivial_vertical_word
    @input = "FOOXMASFOO".split('').join("\n")

    assert_equal 1, xmas_count
  end

  def test_it_can_find_a_diagonal_word
    @input = """
    X...
    .M..
    ..A.
    ...S
    """

    assert_equal 1, xmas_count
  end

  def test_it_can_find_multiple_words
    @input = """
    MMMSXXMASM
    MSAMXMSMSA
    AMXSXMAAMM
    MSAMASMSMX
    XMASAMXAMM
    XXAMMXXAMA
    SMSMSASXSS
    SAXAMASAAA
    MAMMMXMMMM
    MXMXAXMASX
    """

    assert_equal 18, xmas_count
  end
end
