require './van'
require './bike_container'

describe Van do

it_behaves_like BikeContainer

  before(:each) do
    @workingbike = double(:fakebike, broken?: false, working?: true)
    @brokenbike = double(:fakebike, broken?: true, working?: false)
    @dockingstation = double(:fakedockingstation, bikes:[@workingbike, @brokenbike, @brokenbike, @workingbike, @brokenbike])
    @garage = double(:fakegarage, bikes:[@workingbike, @brokenbike, @brokenbike, @workingbike, @brokenbike])
    @emptygarage = double(:fakegarage, bikes:[])
    @emptydockingstation = double(:fakedockingsation, bikes:[])
    allow(@garage).to receive(:class).and_return(Garage)
    allow(@dockingstation).to receive(:class).and_return(DockingStation)
    allow(@emptygarage).to receive(:class).and_return(Garage)
    allow(@emptydockingstation).to receive(:class).and_return(DockingStation)
  end

  it 'will collect broken bikes from docking stations when instructed' do
    gresham_street = @dockingstation
    white_van = Van.new
    white_van.collect(gresham_street)
    expect(white_van.bikes).to eq [@brokenbike, @brokenbike, @brokenbike]
  end

  it 'will remove bikes from docking stations when collecting them' do
    gresham_street = @dockingstation
    white_van = Van.new
    white_van.collect(gresham_street)
    expect(gresham_street.bikes).to eq [@workingbike, @workingbike]
  end




  it 'will collect fixed bikes from garages when instructed' do
    nicks_garage = @garage
    white_van = Van.new
    white_van.collect(nicks_garage)
    expect(white_van.bikes).to eq [@workingbike, @workingbike]
  end

  it 'will remove bikes from garages when collecting them' do
    nicks_garage = @garage
    white_van = Van.new
    white_van.collect(nicks_garage)
    expect(nicks_garage.bikes).to eq [@brokenbike, @brokenbike, @brokenbike]
  end






  it 'will unload broken bikes when at a garage' do
      white_van = Van.new
      add_test_bikes(white_van)
      white_van.unload(@emptygarage)
      expect(@emptygarage.bikes).to eq [@brokenbike, @brokenbike, @brokenbike]
  end

  it 'when bikes are unloaded they will be removed from the van' do
      white_van = Van.new
      add_test_bikes(white_van)
      white_van.unload(@emptygarage)
      expect(white_van.bikes).to eq [@workingbike, @workingbike, @workingbike]
  end

  it 'will unload working bikes when at a docking station' do
      white_van = Van.new
      add_test_bikes(white_van)
      white_van.unload(@emptydockingstation)
      expect(@emptydockingstation.bikes).to eq [@workingbike, @workingbike, @workingbike]
  end

  def add_test_bikes(van)
    3.times { van.add_bike(@workingbike) }
    3.times { van.add_bike(@brokenbike) }
  end

end
