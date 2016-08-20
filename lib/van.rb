require_relative 'docking_station.rb'

class Van
include BikeContainer

  def load_bike(source, working)
    bike = source.remove_bike
    if working #working bike to be loaded
      if bike.working?
        add_bike(bike)
        "#{bike} loaded"
      else source.add_bike(bike)
      end
    else #broken bike to be loaded
      if bike.working? then source.add_bike(bike)
      else
        add_bike(bike)
        "#{bike} loaded"
      end
    end
  end

  def unload_bike(target, working)
    bike = remove_bike
    if working#working bike to be unloaded
      if bike.working?
        target.add_bike(bike)
        "#{bike} unloaded"
      else add_bike(bike)
      end
    else#broken bike to be unloaded
      if bike.working? then add_bike(bike)
      else
        target.add_bike(bike)
        "#{bike} unloaded"
      end
    end
  end

end
