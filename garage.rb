class Garage

  attr_accessor :broken_bike_bay, :working_bike_bay

  def initialize
    @broken_bike_bay = []
    @working_bike_bay = []
  end

  def fix_bikes
    @broken_bike_bay.delete_if do |bike|
      bike.fix
      if bike.broken? == false
        @working_bike_bay << bike
        true
      else
        raise "You doughnut"
      end
    end
  end

end
