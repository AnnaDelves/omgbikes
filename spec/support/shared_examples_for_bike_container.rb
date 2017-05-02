shared_examples_for BikeContainer do

  it 'has a default capacity' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end

  it "can have it's capacity set to something other than the default at initialisation" do
    random_capacity = Random.rand(50)
    toby = described_class.new(random_capacity)
    expect(toby.capacity).to eq random_capacity
  end

end
