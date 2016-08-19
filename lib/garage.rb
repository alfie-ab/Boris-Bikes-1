require_relative 'van.rb'

class Garage

  attr_reader :garage_bikes

  def initialize
    @garage_bikes = []
  end

  def collect_bike(van)
    @garage_bikes += van.van_bikes
    van.van_bikes.each { |bike| van.remove_broken_bike(bike) }
  end

  def repair_bike
    @garage_bikes.map { |bike| bike.fix_bike }
  end

end
