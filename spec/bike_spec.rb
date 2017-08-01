require './bike'

describe Bike do
  let(:bike) {Bike.new}
  describe '#broken?' do
    it 'respond to the method broken?' do
      expect(bike).to respond_to(:broken?)
    end

    it 'can be reported as broken' do
      bike.report_broken
      expect(bike.broken?).to eq true
    end

    it 'initialises as not broken' do
      expect(bike.broken?).to eq false
    end
  end

  describe '#fixing' do
    it 'can be fixed' do
      bike.report_broken
      bike.fix
      expect(bike.broken?).to eq false
    end
  end


end
