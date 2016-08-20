require_relative 'van.rb'

class Garage
  include BikeContainer

  def repair_bike
    @bikes.map { |bike| bike.fix_bike }
  end

end
