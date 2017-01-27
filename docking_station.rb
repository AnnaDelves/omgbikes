class DockingStation

attr_reader :docked_bikes

  def initialize
    @docked_bikes = []

  end

  def release_a_bike
    fail "There are no bikes here you doughnut" if @docked_bikes.empty?
    @docked_bikes.pop
  end

  def return_a_bike(returned_bike)
    fail "There is no space you doughnut" if full?
    @docked_bikes << returned_bike
  end

  private
  def full?
    @docked_bikes.count >= 20
  end

end
