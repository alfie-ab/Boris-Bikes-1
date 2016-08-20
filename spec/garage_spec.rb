require 'garage'

describe Garage do
  it_behaves_like BikeContainer

  let (:broken_bike) { double :broken_bike }

  before(:each) do
    allow(broken_bike).to receive(:working?).and_return(false)
    allow(broken_bike).to receive(:fix_bike).and_return(true)
  end

  describe "repair_bike" do
    it "should be able to respond to the method call" do
      expect(subject).to respond_to(:repair_bike)
    end

    it "should be able to return an array of bikes" do
      subject.add_bike(broken_bike)
      subject.repair_bike
      expect(subject.remove_bike).to eq(broken_bike)
    end
  end
end
