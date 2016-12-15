require './bike'

describe Bike do

  it "respond to the method working?" do
    expect(subject).to respond_to(:working?)
  end

end