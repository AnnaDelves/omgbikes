require './docking_station'

describe DockingStation do

  it_behaves_like BikeContainer

  before(:each) do
    @workingbike = double(:fakebike, broken?: false)
    @brokenbike = double(:fakebike, broken?: true)
  end

  it 'sets the capacity of the docking station when initialized' do
    finsbury_square = DockingStation.new(25)
    expect(finsbury_square.capacity).to eq 25
  end

  describe '#release_a_bike' do
    it 'respond to the method release a bike' do
      expect(subject).to respond_to(:release_a_bike)
    end

    it 'releases a bike object' do
      tobys_bike = @workingbike
      subject.return_a_bike(tobys_bike)
      expect(subject.release_a_bike).to eq tobys_bike
    end

    it 'raises an error when there are no bikes' do
      expect { subject.release_a_bike }.to raise_error 'There are no bikes here you doughnut'
    end

    it 'does not release broken bikes' do
      annas_bike = @brokenbike
      subject.return_a_bike(annas_bike)
      tobys_bike = @workingbike
      subject.return_a_bike(tobys_bike)
      expect(subject.release_a_bike).to eq tobys_bike
    end

      it "gives a different error if all bikes are broken" do
        simons_bike = @brokenbike
        subject.return_a_bike(simons_bike)
        expect {subject.release_a_bike}.to raise_error "Sorry, all the bikes here are out of order at the moment, please try another docking station"
      end

  end

  describe '#return_a_bike' do
    it 'respond to the method return a bike with one argument' do
      expect(subject).to respond_to(:return_a_bike).with(1).argument
    end

    it 'able to dock and register a bike' do
      annas_bike = @workingbike
      subject.return_a_bike(annas_bike)
      expect(subject.docked_bikes).to include annas_bike
    end

    it 'raises an error when you try to dock a bike and the docking station is full' do
      capacity = 20
      capacity.times { subject.return_a_bike(@workingbike) }
      expect { subject.return_a_bike(@brokenbike) }.to raise_error 'There is no space you doughnut'
    end
  end

end
