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

  def unload(garage)
    @stored_bikes.delete_if do |bike|
      if bike.broken? == true
        garage.broken_bikes << bike
      end
    end
  end

  private
  def size_lookup(van_size)
    {small: 15, medium: 20, large: 25}[van_size]
  end

end
