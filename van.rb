class Van

  include BikeContainer

  def collect_bikes(docking_station)
    docking_station.docked_bikes.delete_if do |bike|
      if bike.broken? == true
        @bikes << bike
      end
    end
  end

  def unload(bike_dropoff_area)
    if bike_dropoff_area.class == Garage
      bike_dropoff_area.bikes << broken_bikes
      # @bikes.delete_if do |bike|
      #   if bike.broken? == true
      #     bike_dropoff_area.bikes << bike
      #   end
      # end
    else
      @bikes.delete_if do |bike|
        if bike.broken? == false
          bike_dropoff_area.bikes << bike
        end
      end
    end
  end

  private
  def size_lookup(van_size)
    {small: 15, medium: 20, large: 25}[van_size]
  end

  def broken_bikes
    @bikes.reject {|bike| bike.working?}
  end

  def working_bikes
    @bikes.reject {|bike| bike.broken?}
  end

end
