# takes an input of an array and a sorter, returns raw metrics
require_relative 'sorters/ruby_sort'
require 'benchmark'

class Benchmarker
  attr_reader :unsorted_array, :sorter, :correct_array

  def initialize sorter: "no sorter", array: [], correct_array: []
    raise "no sorter" if sorter == "no sorter"
    raise "empty or no array" if array.length == 0
    @sorter = sorter
    @unsorted_array = array
    @correct_array = correct_array
  end

  def bench
    array = unsorted_array.clone

    array.reset_counters

    start_time = Time.new
    array = sorter.sort unsorted_array
    time_taken = Time.now - start_time

    raise "array not sorted" if array != correct_array

    times_read = array.times_read
    times_written = array.times_written

    return {time_taken: time_taken,
            times_read: times_read,
            times_written: times_written}
  end
end
