shared_examples_for BikeContainer do

  describe 'capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
    end

    it "can have it's capacity set to something other than the default at initialisation" do
      random_capacity = Random.rand(50)
      toby = described_class.new(random_capacity)
      expect(toby.capacity).to eq random_capacity
    end
  end

  describe 'add bike' do
    it 'is able to recieve a bike' do
      annas_bike = double :bike
      subject.add_bike(annas_bike)
      expect(subject.bikes).to include annas_bike
    end

    it 'raises an error when full' do
     subject.capacity.times { subject.add_bike double(:bike) }
     expect { subject.add_bike double(:bike) }.to raise_error "This #{described_class.name} is full, you doughnut"
   end
  end

  describe 'remove bike' do

    context 'when there are bikes' do

      let(:bike) {double :bike}

      before(:each) do
        subject.add_bike(bike)
      end

      it 'is able to have bikes removed' do
        subject.remove_bike
        expect(subject.bikes).to be_empty
      end

      it 'checks bike identity' do
       expect(subject.remove_bike).to eq bike
     end

   end

   context 'when there are no bikes' do

     it 'raises an error when empty' do
       expect { expect(subject.remove_bike) }.to raise_error "This #{described_class.name} is empty, you doughnut"
     end

    end

  end

end
