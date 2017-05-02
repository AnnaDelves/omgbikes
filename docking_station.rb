class DockingStation

    include BikeContainer

  attr_reader :docked_bikes, :bike_location_type

  # def initialize
  #   @docked_bikes = []
  #   ## Toby needs to work out how to get this characteristic, inherited from parent class LocationType, to actually work properly when we try to use it here. It does not work right now. If he hasn't worked it out in a week's time, be very sad.
  #   @bike_location_type = 'container'
  # end
  # Next time we will finish of the initialise portion of the bike container module so that our tests don't get sad when we have two different versions of initialise 

  def release_a_bike
    fail "There are no bikes here you doughnut" if @docked_bikes.empty?
    @docked_bikes.each_with_index do |bike, index|
      if bike.broken? == false
        return @docked_bikes.delete_at(index)
      end
    end
    fail "Sorry, all the bikes here are out of order at the moment, please try another docking station"
  end

  def return_a_bike(returned_bike)
    fail "There is no space you doughnut" if full?
    @docked_bikes << returned_bike
  end

  private
  def full?
    @docked_bikes.count >= DEFAULT_CAPACITY

  end

end
