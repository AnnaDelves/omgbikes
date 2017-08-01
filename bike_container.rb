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
    fail "This #{self.class.name} is empty, you doughnut" if empty?
    bikes.shift
  end


  private
  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def broken_bikes
    @bikes.reject {|bike| bike.working?}
  end

  def working_bikes
    @bikes.reject {|bike| bike.broken?}
  end

end
