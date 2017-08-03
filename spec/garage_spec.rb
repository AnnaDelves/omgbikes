require './garage'

describe Garage do

  it_behaves_like BikeContainer

  let(:brokenbike) {double :bike, broken?: true}

  before(:each) do
    allow(brokenbike).to receive(:fix)
  end

  it 'fixes bikes' do
    annas_bike = brokenbike
    subject.add_bike(annas_bike)
    subject.fix_bikes
    expect(brokenbike).to have_received(:fix)
  end

end
