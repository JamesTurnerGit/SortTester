# Expansion which adds a count method that returns how many times an element has been accessed
require "CountingArray"
describe CountingArray do
  it "knows how many times it's been read" do
    array = CountingArray.new ["hi"]
    repetitons = rand(1..5)
    array.reset_counters
    repetitons.times{array[0]}
    expect(array.times_read).to eq repetitons
  end

  it "knows how many times it's been written to" do
    array = CountingArray.new ["hi"]
    repetitons = rand(1..5)
    array.reset_counters
    repetitons.times{array[0] = "hi"}
    expect(array.times_wrote).to eq repetitons
  end
end
