require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'word_solver'

class WordSearchTest < Minitest::Test
  def xmas_count
    WordSearch.new(@input).word_count
  end

  def test_it_can_find_a_trivial_word
    @input = "FOOXMASFOO"

    assert_equal 1, word_count
  end

  def test_it_can_find_a_trivial_backwards_word
    @input = "OOFSAMXOOF"

    assert_equal 1, word_count
  end

  def test_it_can_find_a_trivial_vertical_word
    @input = "FOOXMASFOO".split('').join("\n")

    assert_equal 1, word_count
  end

  def test_it_can_find_a_diagonal_word
    @input = """
    X...
    .M..
    ..A.
    ...S
    """

    assert_equal 1, word_count
  end

  def test_it_can_find_multiple_words
    @input = """
    ....XXMAS.
    .SAMXMS...
    ...S..A...
    ..A.A.MS.X
    XMASAMX.MM
    X.....XA.A
    S.S.S.S.SS
    .A.A.A.A.A
    ..M.M.M.MM
    .X.X.XMASX
    """

    assert_equal 11, word_count
  end
end
