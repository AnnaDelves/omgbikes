class Van

  attr_reader :capacity
  attr_accessor :stored_bikes

  def initialize(van_size)
    @stored_bikes = []
    @capacity = size_lookup(van_size)
  end

  def collect_bikes(docking_station)
    docking_station.docked_bikes.delete_if do |bike|
      if bike.broken? == true
        @stored_bikes << bike
      end
    end
  end

  def unload(bike_dropoff_area)
    if bike_dropoff_area.is_a?(Garage)
      #The fact that garages are fake in the text might be messing things up. Toby is going to think about it. If he hasn't come back with a solution this time next week be sad.
      @stored_bikes.delete_if do |bike|
        if bike.broken? == true
          bike_dropoff_area.broken_bikes << bike
        end
      end
    else
      @stored_bikes.delete_if do |bike|
        if bike.broken? == false
          bike_dropoff_area.docked_bikes << bike
        end
      end
    end
  end

  private
  def size_lookup(van_size)
    {small: 15, medium: 20, large: 25}[van_size]
  end

end
