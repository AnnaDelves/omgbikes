require './docking_station'

describe DockingStation do

  it "respond to the method release a bike" do
    expect(subject).to respond_to(:release_a_bike)
  end

  it "releases a bike object" do
    tobys_bike = subject.release_a_bike
    expect(tobys_bike).to respond_to(:working?)
  end

  it "respond to the method return a bike with one argument" do
    expect(subject).to respond_to(:return_a_bike).with(1).argument
  end

  it "respond to the method bikes" do
    expect(subject).to respond_to(:bikes)
  end

  it "able to dock and register a bike" do
    annas_bike = Bike.new
    subject.return_a_bike(annas_bike)
    expect(subject.docked_bike).to eq annas_bike
  end

end
