require 'docking_station.rb'

describe Bike do
  it { is_expected.to respond_to :working? }


  it 'should report broken' do
    expect(@bike.report_broken).to eq @status = false
  end

end
