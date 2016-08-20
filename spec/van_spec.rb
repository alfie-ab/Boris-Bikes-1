require 'van'

describe Van do

  it_behaves_like BikeContainer

  let (:broken_bike) { double :broken_bike }
  let (:working_bike) { double :working_bike }
  let(:target) {double :target}
  let(:source) {double :source}

  before(:each) do
    allow(broken_bike).to receive(:working?).and_return(false)
    allow(working_bike).to receive(:working?).and_return(true)
  end

  describe "load_bikes" do

    it "should be able to respond when method is called with 2 args" do
      expect(subject).to respond_to(:load_bike).with(2).arguments
    end

    it 'is called then return broken_bike if the loaded bike removed' do
      allow(source).to receive(:remove_bike).and_return(broken_bike)
      allow(source).to receive(:dock).with(broken_bike) {nil}
      subject.load_bike(source, false)
      expect(subject.remove_bike).to eq(broken_bike)
    end

    it "is called then return the working_bike if the loaded bike removed" do
      allow(source).to receive(:remove_bike).and_return(working_bike)
      allow(source).to receive(:dock).with(working_bike) {nil}
      subject.load_bike(source, true)
      expect(subject.remove_bike).to eq(working_bike)
    end
  end

  describe "unload_bike" do

    it "should be able to respond when method is called with 2 args" do
      expect(subject).to respond_to(:unload_bike).with(2).arguments
    end

    it "is called with working=true on a class with a working_bike then the class should be empty" do
      allow(target).to receive(:add_bike).with(working_bike) {nil}
      subject.add_bike(working_bike)
      subject.unload_bike(target, true)
      expect(subject).to be_empty
    end

    it "is called with working=true on a class with a broken_bike then the class should include the broken_bike" do
      subject.add_bike(broken_bike)
      subject.unload_bike(target, true)
      expect(subject.remove_bike).to eq broken_bike
    end

    it "is called with working=false on a class with a broken_bike then the class should be empty" do
      allow(target).to receive(:add_bike).with(broken_bike) {nil}
      subject.add_bike(broken_bike)
      subject.unload_bike(target, false)
      expect(subject).to be_empty
    end

    it "is called with working=false on a class with a working_bike then the class should containt the working_bike" do
      subject.add_bike(working_bike)
      subject.unload_bike(target, false)
      expect(subject.remove_bike).to eq(working_bike)
    end
  end

end
