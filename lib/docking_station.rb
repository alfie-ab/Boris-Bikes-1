require_relative 'bike.rb'

class DockingStation
  include BikeContainer

  def release_bike
    fail "There are no bikes available" if working_bikes.empty?
    @bikes.delete(working_bikes.shift)
  end

  def dock(bike)
    add_bike(bike)
  end

  private
  def working_bikes
    @bikes.select { |bike| bike.working?}
  end
end
