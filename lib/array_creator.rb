require_relative 'counting_array'

class ArrayCreator
  def initialize array_class: CountingArray
    @array_class = array_class
  end

  def generate length: 5
    sorted = @array_class.new [*1..length]
    unsorted = shuffle sorted
    return sorted, unsorted
  end

  private

  def shuffle array
    array.reverse
    # unsorted = array.shuffle
    # unsorted = shuffle array if unsorted == array
    # unsorted
  end
end
