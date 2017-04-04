class Garage

  attr_accessor :broken_bike_bay, :working_bike_bay

  def initialize
    @broken_bike_bay = []
    @working_bike_bay = []
  end

  def fix_bikes
    @broken_bike_bay.each do |bike|
      if bike.broken? == true
        ## STUFF HAPPENS HERE




      @working_bike_bay << bike
    end
  end

end
