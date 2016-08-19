require_relative 'van.rb'

class Garage

  attr_reader :garage_bikes

  def initialize
    @garage_bikes = []
  end

  def collect_bike(van)
    van.van_bikes.each do |bike|
      if !bike.working?
        @garage_bikes << bike
        van.remove_bike(bike)
      end
    end
  end

  def repair_bike
    @garage_bikes.map { |bike| bike.fix_bike }
  end

  def remove_bike(bike)
    @garage_bikes.delete(bike)
  end

end
