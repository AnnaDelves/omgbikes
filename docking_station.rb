require './locationtype'

class DockingStation < LocationType

  attr_reader :docked_bikes, :capacity, :bike_location_type

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = @bikes_in_storage
    ## Toby needs to work out how to get this characteristic, inherited from parent class LocationType, to actually work properly when we try to use it here. It does not work right now. If he hasn't worked it out in a week's time, be very sad.
    @capacity = capacity
    @bike_location_type = 'container'
  end

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
