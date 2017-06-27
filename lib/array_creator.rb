class ArrayCreator
  def generate length: 5
    sorted = [*1..length]
    unsorted = shuffle sorted
    return sorted, unsorted
  end

  def shuffle array
    unsorted = array.shuffle
    unsorted = shuffle array if unsorted == array
    unsorted
  end
end
