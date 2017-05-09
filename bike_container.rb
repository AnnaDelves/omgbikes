module BikeContainer

  attr_reader :capacity, :bikes

  DEFAULT_CAPACITY = 20

  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def add_bike(bike)
    @bikes << bike
  end

end
