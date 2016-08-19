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
        station.remove_broken_bike(bike)
      end
    end
  end

end
