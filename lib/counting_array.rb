class CountingArray < Array
  attr_reader :times_read, :times_wrote

  def reset_counters
    @times_read = 0
    @times_wrote = 0
  end

  def [] ind
    @times_read += 1
    super ind
  end

  def []= ind, value
    @times_wrote += 1
    super ind, value
  end
end
