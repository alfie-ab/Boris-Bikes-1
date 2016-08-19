require_relative 'bike.rb'

class DockingStation

attr_reader :bikes, :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    working_bikes = @bikes.select{|bike| bike.working?}
    fail "There are no bikes available" if working_bikes.empty?
    working_bikes.pop
  end

  def dock_bike(bike)
    fail "This docking station is full" if full?
    @bikes << bike
  end

  def remove_bike(bike)
    @bikes.delete(bike)
  end

  def collect_bike(van)
    van.van_bikes.each do |bike|
      if bike.working?
        @bikes << bike
        van.remove_bike(bike)
      end
    end
  end

private

def empty?
  @bikes.empty?
end

def full?
  @bikes.count >= DEFAULT_CAPACITY
end

end
