require 'garage'

describe Garage do
  let (:broken_bike) { double :broken_bike }
  let (:working_bike) { double :working_bike }
  let (:van) {double :van}

  before(:each) do
    allow(broken_bike).to receive(:working?).and_return(false)
    allow(working_bike).to receive(:working?).and_return(true)
    allow(van).to receive(:van_bikes).and_return([broken_bike])
    allow(van).to receive(:remove_broken_bike).with(broken_bike) {[]}
  end

  it "should be able to respond to the method" do
    expect(subject).to respond_to(:collect_bike).with(1).arguments
  end

  it "should be able to collect broken bikes" do
    subject.collect_bike(van)
    expect(subject.garage_bikes).to eq([broken_bike])
  end

end
