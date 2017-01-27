require './docking_station'

describe DockingStation do

  it "respond to the method release a bike" do
    expect(subject).to respond_to(:release_a_bike)
  end

  it "releases a bike object" do
    tobys_bike = Bike.new
    subject.return_a_bike(tobys_bike)
    expect(subject.release_a_bike).to eq tobys_bike
  end

  it "respond to the method return a bike with one argument" do
    expect(subject).to respond_to(:return_a_bike).with(1).argument
  end

  it "able to dock and register a bike" do
    annas_bike = Bike.new
    subject.return_a_bike(annas_bike)
    expect(subject.docked_bikes).to include annas_bike
  end

  it "raises an error when there are no bikes" do
    expect {subject.release_a_bike}.to raise_error "There are no bikes here you doughnut"
  end

  it "raises an error when you try to dock a bike and the docking station is full" do
    CAPACITY.times {subject.return_a_bike(Bike.new)}
    expect {subject.return_a_bike(Bike.new)}.to raise_error "There is no space you doughnut"
  end


end
