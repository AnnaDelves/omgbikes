class DockingStation

  include BikeContainer

  def release_a_bike
    fail "There are no working bikes here you doughnut" if working_bikes.empty?
    @bikes.delete (working_bikes.shift)
  end

  def return_a_bike(returned_bike)
    add_bike(returned_bike)
  end

end
