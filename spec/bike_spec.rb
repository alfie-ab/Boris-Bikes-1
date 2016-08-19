require 'bike.rb'

describe Bike do
  it { is_expected.to respond_to :working? }


  it 'should report broken' do
    expect(subject.report_broken).to eq @status = false
  end

  it 'should fix the bike' do
    bike1 = Bike.new
    bike1.report_broken
    expect(bike1.fix_bike).to eq @status = true
  end
end
