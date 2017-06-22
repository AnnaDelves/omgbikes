require './van'
require './bike_container'

describe Van do

it_behaves_like BikeContainer

  before(:each) do
    @workingbike = double(:fakebike, broken?: false)
    @brokenbike = double(:fakebike, broken?: true)
    @dockingstation = double(:fakedockingstation, docked_bikes:[@workingbike, @brokenbike, @brokenbike, @workingbike, @brokenbike], bike_location_type:'container')
    @garage = double(:fakegarage, bikes:[])
    @emptydockingstation = double(:fakedockingsation, bikes:[])
    allow(@garage).to receive(:class).and_return(Garage)
    allow(@dockingstation).to receive(:class).and_return(DockingStation)
  end

  it 'will collect bikes from the docking station when instructed' do
    gresham_street = @dockingstation
    white_van = Van.new
    white_van.collect_bikes(gresham_street)
    expect(white_van.bikes).to eq [@brokenbike, @brokenbike, @brokenbike]
  end

  it 'will remove bikes from docking station when collecting them' do
    gresham_street = @dockingstation
    white_van = Van.new
    white_van.collect_bikes(gresham_street)
    expect(gresham_street.docked_bikes).to eq [@workingbike, @workingbike]
  end

  it 'will unload broken bikes when at a garage' do
      white_van = Van.new
      white_van.add_bike(@workingbike)
      white_van.add_bike(@brokenbike)
      white_van.add_bike(@brokenbike)
      white_van.unload(@garage)
      expect(@garage.bikes).to eq [@brokenbike, @brokenbike]
  end

  it 'when bikes are unloaded they will be removed from the van' do
      white_van = Van.new
      white_van.add_bike(@workingbike)
      white_van.add_bike(@brokenbike)
      white_van.add_bike(@brokenbike)
      white_van.unload(@garage)
      expect(white_van.bikes).to eq [@workingbike]
  end

  it 'will unload working bikes when at a docking station' do
      white_van = Van.new
      white_van.add_bike(@workingbike)
      white_van.add_bike(@workingbike)
      white_van.add_bike(@brokenbike)
      white_van.unload(@emptydockingstation)
      expect(@emptydockingstation.bikes).to eq [@workingbike, @workingbike]
  end

end
