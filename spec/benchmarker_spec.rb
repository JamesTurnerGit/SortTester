require 'benchmarker'

describe Benchmarker do
  let(:sorter){double("sorter",sort: sorted_array)}
  let(:unsorted_array) {double("unsorted_array", length: 5,reset_counters: nil)}
  let(:sorted_array)   {double("sorted_array", times_read: 10,times_written: 15 )}
  let(:pre_sorted_array) {double("sorted_array")}

  before(:each){
    allow(unsorted_array).to receive(:clone).and_return(unsorted_array)
  }

  subject{Benchmarker.new sorter: sorter, array: unsorted_array, correct_array: sorted_array}

  describe "#bench" do
    it "tells sorter to sort array" do
      subject.bench
      expect(sorter).to have_received(:sort).with unsorted_array
    end

    it "checks array against correct array and raises on failure" do
      allow(sorter).to receive(:sort).and_return(unsorted_array)
      expect{subject.bench}.to raise_error "array not sorted"
    end

    it "returns the time taken" do
      allow(Time).to receive(:new).and_return(Time.mktime(2015,10,21,7,28,00))
      allow(Time).to receive(:now).and_return(Time.mktime(2015,10,21,7,28,05))
      expect(subject.bench[:time_taken]).to eq 5
    end

    it "resets the counters before running sort" do
      subject.bench
      expect(unsorted_array).to have_received(:reset_counters)
    end

    it "returns the amount of times array was read" do
      expect(subject.bench[:times_read]).to eq 10
    end

    it "returns the amount of times array was written to" do
      expect(subject.bench[:times_written]).to eq 15
    end
  end
end
