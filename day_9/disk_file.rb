class DiskFile
  attr_reader :id, :size

  def initialize(id, size)
    @id = id
    @size = size
  end

  def inspect
    "#<File:#{id}>"
  end
end
