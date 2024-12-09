require_relative 'disk_file'

class DiskCompactor
  def initialize(disk_map)
    @disk_map = disk_map
    @files = []
    parse_disk_map
  end

  def compact!
    cursor = 0
    file_block = @disk.size

    while cursor < file_block do
      if @disk[cursor] != nil
        cursor += 1
        next
      end

      if @disk[file_block] == nil
        file_block -= 1
        next
      end

      @disk[cursor] = @disk[file_block]
      @disk[file_block] = nil
    end
  end

  def contiguous_compact!
    @files.reverse.each do |file|
      file_start = @disk.find_index(file)
      file_end = file_start + file.size

      first_block = first_available_block(file.size)
      if first_block && first_block < file_start
        write_disk((first_block...first_block + file.size), file)
        write_disk((file_start...file_end), nil)
      end
    end
  end

  def checksum
    checksum = 0
    @disk.each_with_index do |disk_file, disk_position|
      next if disk_file.nil?
      checksum += disk_file.id * disk_position
    end

    return checksum
  end

  private

  def parse_disk_map
    i = 0
    @disk = []
    @files = []
    while i < @disk_map.length
      disk_size = @disk_map[i].to_i
      file = i.odd? ? nil : DiskFile.new(i / 2, disk_size) # Free spaces are always odd indices
      @files << file if file
      @disk += [file] * disk_size
      i += 1
    end 
  end

  def first_available_block(size)
    i = 0
    while i < @disk.size
      return i if @disk[i].nil? && @disk[(i...i + size)].none?
      i += 1
    end

    return nil
  end

  def write_disk(blocks, contents)
    blocks.each { |block| @disk[block] = contents }
  end
end
