require './van'

describe Van do
  before(:each) do
    @workingbike = double(:fakebike, broken?: false)
    @brokenbike = double(:fakebike, broken?: true)
    @dockingstation = double(:fakedockingstation, docked_bikes:[@workingbike, @brokenbike, @brokenbike, @workingbike, @brokenbike])
    @garage = double(:fakegarage, broken_bikes:[])
    @emptydockingsation = double(:fakedockingsation, docked_bikes:[])
  end

  it 'sets the capacity of the van when initialized' do
    white_van = Van.new(:small)
    expect(white_van.capacity).to eq 15
  end

  it 'will collect bikes from the docking station when instructed' do
    gresham_street = @dockingstation
    white_van = Van.new(:small)
    white_van.collect_bikes(gresham_street)
    expect(white_van.stored_bikes).to eq [@brokenbike, @brokenbike, @brokenbike]
  end

  it 'will remove bikes from docking station when collecting them' do
    gresham_street = @dockingstation
    white_van = Van.new(:small)
    white_van.collect_bikes(gresham_street)
    expect(gresham_street.docked_bikes).to eq [@workingbike, @workingbike]
  end

  it 'will unload broken bikes when at a garage' do
      white_van = Van.new(:large)
      white_van.stored_bikes = [@workingbike, @brokenbike, @brokenbike, @workingbike, @brokenbike]
      # Toby needs to research how to keep my vans safe
      white_van.unload(@garage)
      expect(@garage.broken_bikes).to eq [@brokenbike, @brokenbike, @brokenbike]
  end

  it 'when bikes are unloaded they will be removed from the van' do
      white_van = Van.new(:large)
      white_van.stored_bikes = [@workingbike, @brokenbike, @brokenbike, @workingbike, @brokenbike]
      # Toby still needs to research how to keep my vans safe
      white_van.unload(@garage)
      expect(white_van.stored_bikes).to eq [@workingbike, @workingbike]
  end

  it 'will unload working bikes when at a docking station' do
      white_van = Van.new(:large)
      white_van.stored_bikes = [@workingbike, @brokenbike, @brokenbike, @workingbike, @brokenbike]
      # Toby needs to research how to keep my vans safe
      white_van.unload(@emtydockingstation)
      expect(@emptydockingstation.docked_bikes).to eq [@workingbike, @workingbike]
  end

end
