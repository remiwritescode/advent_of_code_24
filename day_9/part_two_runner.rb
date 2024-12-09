require_relative 'disk_compactor'

disk_map = File.read('input.txt')

compactor = DiskCompactor.new(disk_map)
compactor.contiguous_compact!
p compactor.checksum
