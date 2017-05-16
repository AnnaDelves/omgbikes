module BikeContainer

  attr_reader :capacity, :bikes

  DEFAULT_CAPACITY = 20

  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def add_bike(bike)
    fail "This #{self.class.name} is full, you doughnut" if full?
    @bikes << bike
  end

  def remove_bike
    bikes.pop
  end


  private
  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
