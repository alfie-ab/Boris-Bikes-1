require 'docking_station.rb'

describe DockingStation do

  let (:bike) { double :bike }

  it 'should release the working bike' do
    subject.dock_bike (:bike)
    bike = subject.release_bike
    expect(bike).to be_working
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
    expect{subject.capacity.times {subject.dock_bike(Bike.new)}}.to raise_error(RuntimeError)
  end


  it 'should set a given capacity' do
    expect(subject.capacity).not_to eq DockingStation.new(30)
  end

  it 'should not release bike if bike is broken' do
    bike1 = double(:bike)
    bike1.report_broken
    ds1 = DockingStation.new
    ds1.dock_bike(bike1)
    expect{ds1.release_bike}.to raise_error(RuntimeError)
  end

end
