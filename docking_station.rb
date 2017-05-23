class DockingStation

  include BikeContainer

  def release_a_bike
    fail "There are no bikes here you doughnut" if @bikes.empty?
      @bikes.each_with_index do |bike, index|
        if bike.broken? == false
          return @bikes.delete_at(index)
        end
      end
    fail "Sorry, all the bikes here are out of order at the moment, please try another docking station"
  end

  def return_a_bike(returned_bike)
    add_bike(returned_bike)
  end

end
