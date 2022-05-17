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

  xit 'has a name' do



  end
end
