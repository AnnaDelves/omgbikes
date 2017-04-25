require './garage'

describe Garage do
  before(:each) do
    @workingbike = double(:fakebike, broken?: false )
    @brokenbike = double(:fakebike, broken?: true )
    allow(@brokenbike).to receive(:fix)
  end

  it 'is capable of storing broken bikes' do
    expect(subject.broken_bike_bay).to eq []
  end

  it 'is capable of storing working bikes' do
    expect(subject.working_bike_bay).to eq []
  end

  # it 'fixes bikes' do
  #   tobys_garage = Garage.new
  #   tobys_garage.broken_bike_bay = [@brokenbike]
  #   tobys_garage.fix_bikes
  #   expect(@brokenbike).to have_received(:fix)
  # end
  #
  # it 'moves them to the working bike bay' do
  #   tobys_garage = Garage.new
  #   tobys_garage.broken_bike_bay = [@brokenbike, @brokenbike, @brokenbike]
  #   tobys_garage.fix_bikes
  #   expect(tobys_garage.working_bike_bay.count).to eq 3
  # end


end
