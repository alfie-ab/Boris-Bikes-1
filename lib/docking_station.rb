class DockingStation

attr_reader :bike, :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    working_bikes = @bikes.select{|bike| bike.working?}
    fail "There are no bikes available" if empty?
    working_bikes.pop
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
  @bikes.count >= DEFAULT_CAPACITY
end

end


class Bike

  def initialize
    @status = true
  end

  def working?
    @status
  end

  def report_broken
    @status = false
  end

end
