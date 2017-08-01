shared_examples_for BikeContainer do

  let(:bikecontainer) {described_class.new}

  describe 'capacity' do
    it 'has a default capacity' do
      expect(bikecontainer.capacity).to eq BikeContainer::DEFAULT_CAPACITY
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
      bikecontainer.add_bike(annas_bike)
      expect(bikecontainer.bikes).to include annas_bike
    end

    it 'raises an error when full' do
     bikecontainer.capacity.times { bikecontainer.add_bike double(:bike) }
     expect { bikecontainer.add_bike double(:bike) }.to raise_error "This #{described_class.name} is full, you doughnut"
   end
  end

  describe 'remove bike' do

    context 'when there are bikes' do

      let(:bike) {double :bike}

      before(:each) do
        bikecontainer.add_bike(bike)
      end

      it 'is able to have bikes removed' do
        bikecontainer.remove_bike
        expect(bikecontainer.bikes).to be_empty
      end

      it 'checks bike identity' do
       expect(bikecontainer.remove_bike).to eq bike
     end

   end

   context 'when there are no bikes' do

     it 'raises an error when empty' do
       expect { expect(bikecontainer.remove_bike) }.to raise_error "This #{described_class.name} is empty, you doughnut"
     end

    end

  end

end
