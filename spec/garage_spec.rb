require './garage'

describe Garage do
  before(:each) do
    @workingbike = double(:fakebike, broken?: false)
    @brokenbike = double(:fakebike, broken?: true)
  end

  it 'is capable of storing broken bikes' do
    expect(subject.broken_bike_bay).to eq []
  end

  it 'is capable of storing working bikes' do
    expect(subject.working_bike_bay).to eq []
  end

  it 'fixes bikes and moves them to the working bike bay' do
    tobys_garage = Garage.new
    tobys_garage.broken_bike_bay = [@brokenbike, @brokenbike, @brokenbike]
    tobys_garage.fix_bikes
    expect tobys_garage.working_bike_bay.to eq [@workingbike, @workingbike, @workingbike]
  end


end
