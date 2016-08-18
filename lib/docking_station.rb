class DockingStation

attr_reader :bike

  def initialize(capacity = 20)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "There are no bikes available" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail "This docking station is full" if full?
    @bikes << bike
  end

private

def empty?
  @bikes.empty?
end

def full?
  @bikes.count >= 20
end

end




class Bike
  def working?
    true
  end
end
