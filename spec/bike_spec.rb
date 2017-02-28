require './bike'

describe Bike do
  describe '#broken?' do
    it 'respond to the method broken?' do
      expect(subject).to respond_to(:broken?)
    end

    it 'can be reported as broken' do
      subject.report_broken
      expect(subject.broken?).to eq true
    end

    it 'initialises as not broken' do
      expect(subject.broken?).to eq false
    end

  end
end
