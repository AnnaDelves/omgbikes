require './van'
require './bike_container'

describe Van do

it_behaves_like BikeContainer

  let(:white_van) {Van.new}
  let(:workingbike) {double :fakebike, broken?: false}
  let(:brokenbike) {double :fakebike, broken?: true}
  let(:dockingstation) {double(:fakedockingstation, bikes:[workingbike, brokenbike, brokenbike, workingbike, brokenbike])}
  let(:garage) {double(:fakegarage, bikes:[workingbike, brokenbike, brokenbike, workingbike, brokenbike])}

  before(:each) do
    allow(garage).to receive(:class).and_return(Garage)
    allow(dockingstation).to receive(:class).and_return(DockingStation)
  end

  it 'will build vans of different sizes' do
    small_van = Van.build(:small)
    expect(small_van.capacity).to eq 15
  end

  describe '#collect' do
    it 'will collect broken bikes from docking stations when instructed' do
      gresham_street = dockingstation
      white_van.collect(gresham_street)
      expect(white_van.bikes).to eq [brokenbike, brokenbike, brokenbike]
    end

    it 'will remove bikes from docking stations when collecting them' do
      gresham_street = dockingstation
      white_van.collect(gresham_street)
      expect(gresham_street.bikes).to eq [workingbike, workingbike]
    end

    it 'will collect fixed bikes from garages when instructed' do
      nicks_garage = garage
      white_van.collect(nicks_garage)
      expect(white_van.bikes).to eq [workingbike, workingbike]
    end

    it 'will remove bikes from garages when collecting them' do
      nicks_garage = garage
      white_van.collect(nicks_garage)
      expect(nicks_garage.bikes).to eq [brokenbike, brokenbike, brokenbike]
    end
  end

  describe '#unload' do
    before(:each) do
      add_test_bikes(white_van)
    end

    it 'will unload broken bikes when at a garage' do
        white_van.unload(garage)
        expect(garage.bikes).to eq [workingbike, brokenbike, brokenbike, workingbike, brokenbike, brokenbike, brokenbike, brokenbike]
    end

    it 'will unload working bikes when at a docking station' do
        white_van.unload(dockingstation)
        expect(dockingstation.bikes).to eq [workingbike, brokenbike, brokenbike, workingbike, brokenbike, workingbike, workingbike, workingbike]
    end

    it 'when bikes are unloaded they will be removed from the van' do
        white_van.unload(garage)
        expect(white_van.bikes).to eq [workingbike, workingbike, workingbike]
    end
  end

  def add_test_bikes(van)
    3.times { van.add_bike(workingbike) }
    3.times { van.add_bike(brokenbike) }
  end

end
