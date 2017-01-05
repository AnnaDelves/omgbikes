class DockingStation

attr_reader :docked_bike

  def release_a_bike
    fail "There are no bikes here you doughnut" unless @docked_bike
    @docked_bike
  end

  def return_a_bike(returned_bike)
    @docked_bike = returned_bike
  end

end
