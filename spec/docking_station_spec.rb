require './docking_station'

describe DockingStation do

  it "respond to the method release a bike" do
    expect(subject).to respond_to(:release_a_bike)
  end

  it "releases a bike object" do
    tobys_bike = subject.release_a_bike
    expect(tobys_bike).to respond_to(:working?)
  end

end
