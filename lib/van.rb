require_relative 'docking_station.rb'

class Van
include BikeContainer

  def load_bike(source, working)
    bike = source.remove_bike
    if working #working bikes to be loaded
      bike.working? ? add_bike(bike) : source.dock(bike)
    else #broken bikes to be loaded
      bike.working? ? source.dock(bike) : add_bike(bike)
    end
  end

  def unload_bike(target, working)
    bike = remove_bike
    if working#working bikes to be unloaded
      bike.working? ? target.add_bike(bike) : add_bike(bike)
    else#broken bikes to be unloaded
      bike.working? ? add_bike(bike) : target.add_bike(bike)
    end
  end

end
