class Garage

  include BikeContainer

  def fix_bikes
    broken_bikes.each do |bike|
      bike.fix
    end
  end

  private
  def broken_bikes
    @bikes.reject {|bike| bike.working?}
  end

  def working_bikes
    @bikes.reject {|bike| bike.broken?}
  end

end
