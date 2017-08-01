class Garage

  include BikeContainer

  def fix_bikes
    broken_bikes.each do |bike|
      bike.fix
    end
  end

end
