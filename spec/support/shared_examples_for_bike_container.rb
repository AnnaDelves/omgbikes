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

  end

end
