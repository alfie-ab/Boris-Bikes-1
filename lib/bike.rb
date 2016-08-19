class Bike

  def initialize
    @status = true
  end

  def report_broken
    @status = false
  end

  def working?
    @status
  end

  def fix_bike
    @status = true
  end

end
