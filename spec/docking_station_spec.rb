require 'docking_station'
require 'support/shared_examples_for_bike_container'

describe DockingStation do

  it_behaves_like BikeContainer

  let (:working_bike) { double :working_bike }
  let (:broken_bike) { double :broken_bike }

  before(:each) do
    allow(working_bike).to receive(:working?).and_return(true)
    allow(broken_bike).to receive(:working?).and_return(false)
  end

  describe "release_bike" do
    it 'should release the working bike' do
      subject.dock(working_bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end

    it 'should release only a working bike' do
      subject.dock(broken_bike)
      subject.dock(working_bike)
      expect(subject.release_bike).to eq(working_bike)
    end

    it 'should raise error if station is empty' do
      expect{subject.release_bike}.to raise_error(RuntimeError, "There are no bikes available")
    end

    it 'should not release broken bike if it is the only bike at the docking station' do
      subject.dock(broken_bike)
      expect{subject.release_bike}.to raise_error(RuntimeError, "There are no bikes available")
    end
  end

  describe "dock" do
    it 'should dock a bike to an empty station' do
      expect(subject.dock :bike).to eq([(:bike)])
    end

    it 'should raise error if station is full' do
      subject.capacity.times {subject.dock(:bike)}
      expect{subject.dock(:bike)}.to raise_error(RuntimeError)
    end
  end

end
