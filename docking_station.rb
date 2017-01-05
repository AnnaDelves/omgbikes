class DockingStation

attr_reader :docked_bike

  def release_a_bike
    Bike.new

  end

  def return_a_bike(returned_bike)
    @docked_bike = returned_bike
  end

end
