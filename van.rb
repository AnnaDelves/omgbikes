class Van

  include BikeContainer

  def collect(bike_collection_area)
    bike_collection_area.class == Garage ? handle_garage(bike_collection_area) : handle_docking_station(bike_collection_area)
  end

  # Toby has a way to shorten the above - start there next time!

  def unload(bike_dropoff_area)
    if bike_dropoff_area.class == Garage
      broken_bikes.each { |bike| bike_dropoff_area.bikes << bike }
      @bikes = @bikes - broken_bikes
    else
      working_bikes.each { |bike| bike_dropoff_area.bikes << bike }
      @bikes = @bikes - working_bikes
    end
  end

  private
  # Move this logic to be part of a build method
  def size_lookup(van_size)
    {small: 15, medium: 20, large: 25}[van_size]
  end

  def broken_bikes
    @bikes.reject {|bike| bike.working?}
  end

  def working_bikes
    @bikes.reject {|bike| bike.broken?}
  end

  def handle_garage(bike_collection_area)
    bike_collection_area.bikes.delete_if {|bike| @bikes << bike if bike.working?}
  end

  def handle_docking_station(bike_collection_area)
    bike_collection_area.bikes.delete_if {|bike| @bikes << bike if bike.broken?}
  end

end
