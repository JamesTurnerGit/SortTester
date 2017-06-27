# Expansion which adds a count method that returns how many times an element has been accessed
require "counting_array"

describe CountingArray do
  subject { CountingArray.new ["hi"]}
  before(:each){
    subject.reset_counters
  }
  it "knows how many times it's been read" do
    repetitons = rand(1..5)
    repetitons.times{subject[0]}
    expect(subject.times_read).to eq repetitons
  end

  it "knows how many times it's been written to" do
    repetitons = rand(1..5)
    repetitons.times{subject[0] = "hi"}
    expect(subject.times_wrote).to eq repetitons
  end

  it "increments only the correct counter" do
    subject[0]
    expect(subject.times_read).to eq 1
    expect(subject.times_wrote).to eq 0
    subject.reset_counters
    subject[0] = "hi"
    expect(subject.times_read).to eq 0
    expect(subject.times_wrote).to eq 1
  end
end
