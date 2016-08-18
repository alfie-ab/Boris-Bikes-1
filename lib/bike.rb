class Bike

  def initialize

    @broken_bikes = []
  end
  def working?
    true
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken_bikes << bike
  end
end
