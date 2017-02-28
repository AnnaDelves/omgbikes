class DockingStation

  attr_reader :docked_bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
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
