require './garage'

describe Garage do

  it_behaves_like BikeContainer

  before(:each) do
    @brokenbike = double(:fakebike, broken?: true, working?: false )
    allow(@brokenbike).to receive(:fix)
  end

  it 'fixes bikes' do
    annas_bike = @brokenbike
    subject.add_bike(annas_bike)
    subject.fix_bikes
    expect(@brokenbike).to have_received(:fix)
  end

end
