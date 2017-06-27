# creates different types and numbers of arrays shuffled in various ways
require 'array_creator'
describe ArrayCreator do
  it "returns an array of the specified length" do
    random_length = rand(1..10)
    sorted, _ = subject.generate(length: random_length)
    expect(sorted.length).to eq random_length
  end
  it "returns an unsorted and sorted version of an array" do
    sorted, unsorted = subject.generate(length:2)
    expect(sorted).to eq unsorted.sort
    expect(sorted).not_to eq unsorted
  end
end
