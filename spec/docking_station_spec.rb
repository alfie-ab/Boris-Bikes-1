require 'docking_station.rb'

describe DockingStation do

  let (:bike) { double :bike }
  let (:bike1) { double :bike1 }

  before(:each) do
    allow(bike).to receive(:working?).and_return(true)
    allow(bike1).to receive(:working?).and_return(false)
  end

  it 'should release the working bike' do
    subject.dock_bike(bike)
    released_bike = subject.release_bike
    expect(released_bike).to be_working
  end

  it 'should raise error if no bikes available' do
    expect{subject.release_bike}.to raise_error(RuntimeError)
  end

  it 'should dock a bike to an empty station' do
    expect(subject.dock_bike :bike).to eq([(:bike)])
  end

  it 'should have a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'should raise error if station is full' do
    20.times {subject.dock_bike(:bike)}
    expect{subject.dock_bike(:bike)}.to raise_error(RuntimeError)
  end


  it 'should set a given capacity' do
    expect(subject.capacity).not_to eq DockingStation.new(30)
  end

  it 'should not release broken bike if it is the only bike at the docking station' do
    subject.dock_bike(bike1)
    expect{subject.release_bike}.to raise_error(RuntimeError)
  end

  it 'should release only a working bike' do
    subject.dock_bike(bike1)
    subject.dock_bike(bike)
    expect(subject.release_bike).to eq(bike)
  end

end
