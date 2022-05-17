require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  #added in before each method. Use @cruiser when calling cruiser instance variable in test file.
  before :each do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'ship exists' do
    expect(@cruiser).to be_instance_of(Ship)
  end

  it 'has a name' do
    expect(@cruiser.name).to eq("Cruiser")

  end
  it 'has a length' do
    expect(@cruiser.length).to eq(3)
  end

end
