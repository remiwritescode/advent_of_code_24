require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative 'disk_compactor'

class DiskCompactorTest < Minitest::Test
  def compacted_checksum
    compactor = DiskCompactor.new(@disk_map)
    disk_compactor.compact!

    return disk_compactor.checksum
  end

  def test_it_can_compact_a_simple_disk
    @disk_map = "101"

    assert_equal 2, compacted_checksum
  end

  def test_it_can_compact_a_more_complex_disk
    skip
    @disk_map = "2333133121414131402"

    assert_equal 1928, compacted_checksum
  end
end
