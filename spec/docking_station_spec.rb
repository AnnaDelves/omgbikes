require './docking_station'

describe DockingStation do

  it "respond to the method release a bike" do
    expect(subject).to respond_to(:release_a_bike)
  end

end