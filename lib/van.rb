require_relative 'docking_station.rb'

class Van

attr_reader :van_bikes

  def initialize
    @van_bikes = []
  end

  def collect_bike(station)
    station.bikes.each do |bike|
      if !bike.working?
        @van_bikes << bike
        station.remove_bike(bike)
      end
    end
  end

  def collect_fixed_bike(garage)
    garage.garage_bikes.each do |bike|
      if bike.working?
        @van_bikes << bike
        garage.remove_bike(bike)
      end
    end
  end

  def remove_bike(bike)
    @van_bikes.delete(bike)
  end

end
