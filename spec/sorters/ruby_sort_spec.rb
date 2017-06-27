# just a dumb class to get a quick working sort going
require "sorters/ruby_sort"
describe RubySort do
  it "does a basic sort on an array" do
    array = [*0..5].shuffle
    expect(subject.sort array).to eq [*0..5]
  end
end
