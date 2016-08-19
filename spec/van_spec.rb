require 'van.rb'

describe Van do

  let (:broken_bike) { double :broken_bike }
  let (:station) { double :station }
  let (:working_bike) { double :working_bike }
  let (:garage) { double :garage }

  before(:each) do
    allow(broken_bike).to receive(:working?).and_return(false)
    allow(working_bike).to receive(:working?).and_return(true)
    allow(station).to receive(:bikes).and_return([broken_bike, working_bike])
    allow(station).to receive(:remove_bike).with(broken_bike) {[working_bike]}
    allow(garage).to receive(:garage_bikes).and_return([working_bike, broken_bike])
    allow(garage).to receive(:remove_bike).with(working_bike) {[broken_bike]}
  end

  it 'should be able to respond to the method' do
    expect(subject).to respond_to(:collect_bike).with(1).arguments
  end

  it 'should be able to collect broken bikes' do
    subject.collect_bike(station)
    expect(subject.van_bikes).to eq([broken_bike])
  end

  it "should remove a bike" do
    subject.collect_bike(station)
    subject.remove_bike(broken_bike)
    expect(subject.van_bikes).to eq([])
  end

  it "should be able to respond to the method" do
    expect(subject).to respond_to(:collect_fixed_bike).with(1).arguments
  end

  it "should collect fixed bikes" do
    subject.collect_fixed_bike(garage)
    expect(subject.van_bikes).to eq([working_bike])
  end

end
