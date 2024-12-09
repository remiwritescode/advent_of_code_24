require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative 'disk_compactor'

class DiskCompactorTest < Minitest::Test
  def compacted_checksum
    compactor = DiskCompactor.new(@disk_map)
    compactor.compact!

    return compactor.checksum
  end

  def contiguously_compacted_checksum
    compactor = DiskCompactor.new(@disk_map)
    compactor.contiguous_compact!

    return compactor.checksum
  end

  def test_it_can_compact_a_simple_disk
    @disk_map = "111"

    assert_equal 1, compacted_checksum
  end

  def test_it_can_compact_a_more_complex_disk
    @disk_map = "2333133121414131402"

    assert_equal 1928, compacted_checksum
  end

  def test_it_can_contiguously_compact_a_simple_disk
    @disk_map = "122"
    # 011..

    assert_equal 3, contiguously_compacted_checksum
  end

  def test_it_will_not_move_files_that_cant_be_compacted
    @disk_map = "112"
    # 0.11
    
    assert_equal 5, contiguously_compacted_checksum
  end

  def test_it_can_contiguously_compact_a_more_complex_disk
    @disk_map = "2333133121414131402"

    assert_equal 2858, contiguously_compacted_checksum
  end
end
